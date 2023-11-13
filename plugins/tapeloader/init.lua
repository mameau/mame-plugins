-- license:BSD-3-Clause
-- copyright-holders:sairuk, danmons

local exports = {
	name = 'tapeloader',
	version = '0.0.1',
	description = 'disable throttling, enable frameskip until (n) tape index',
	license = 'GPLv3 or whatever',
	author = { name = 'sairuk' } }

local tapeloader = exports

function tapeloader.startplugin()
	local period = 100
	local st
	local d
	local t
	local m
	local fastloading = false
	local s = ""

	-- keywords
	local kw_stop = "&stop"
	local kw_start = "&start"
	local kw_fwd = "&fwd"
	local kw_rev = "&rev"
	local kw_pos = "&pos"
	local kw_space = "&s"
	local kw_lf = "&n"
	local kw_cr = "&r"


	-- based on timecode plugin but handles env vars in paths
	local function get_settings_path()
		local path = manager.machine.options.entries.homepath:value():match('([^;]+)') .. '/tapeloader'
		-- check if we have env vars in path (e.g. starting with $)
		if string.match(path,'$') then
			local t_env={}
			-- split the path
			for str in string.gmatch(path, "([^/\\]+)") do
				if str:sub(1,1) == '$' then
					str = os.getenv(str:sub(2))
				end
                	table.insert(t_env, '/' .. str)
	        	end
			-- rebuild the path
			return table.concat(t_env,"/")
		end
		return path
	end

	-- return the basename of a path
	-- https://github.com/Donearm/scripts/blob/master/lib/basename.lua
	local function basename(str)
		local base = string.gsub(str, "(.*/)(.*)", "%2")
		return base
	end

		-- return the filename only
	local function filename(str)
		local fname = string.gsub(basename(str), "(.*)[.](.+)", "%1")
		return fname
	end

	-- return the file extension only
	local function fileext(str)
		local fname = string.gsub(basename(str), "(.*)[.](.+)", "%2")
		return fname
	end

	local function tapeloader_getfile(f)
		local path = get_settings_path()
		local attr = lfs.attributes(path)
		if not attr then
			lfs.mkdir(path)
		end
		return io.open(path .. '/' .. f, "r")
	end

	local function tapeloader_softwareinfo(s, m)
		tl_software_data = tapeloader_getfile("tape_index.txt")
		tl_playscript = {}
		for line in tl_software_data:lines() do
			if string.match(line, "^[^#].*") then
				game,machine,script = string.match(line, "(.+);(.+);(.*)")
				if game == s and machine == m then
					emu.print_info("Found game: \"" .. game .. "\" machine: \"" .. machine .. "\"")
					entries = string.gmatch(script, "([^\\^]+)")
					for entry in entries do
						index,command = string.match(entry, "(.+),(.+)")
						tl_playscript[index] = command
					end
					return tl_playscript
				end
			end
		end
		emu.print_error("No games/machine matches, you should add a profile")
		os.exit()
	end

	local function start_fastload()
		emu.print_info("Starting fastload (" .. t_report .. ")")
		-- speed up emulation for tape loading
		m.video.throttled = false
		m.video.frameskip = 10
		mame_manager.ui.show_fps = true
		manager.machine.sound.ui_mute = true
		fastloading = true
		if not t.is_playing then t:play() end
	end

	local function stop_fastload()
		emu.print_info("Stopping fastload (" .. t_report .. ")")
		m.video.throttled = true
		m.video.frameskip = 0
		mame_manager.ui.show_fps = false
		manager.machine.sound.ui_mute = false
		fastloading = false
		--t:stop()
	end

	-- register callback after reset
	emu.register_start(
		function()
			if emu.romname() ~= '___empty' then
				if emu.softname() ~= '___empty' then
					m = manager.machine
					-- return 1st cassette device
					for i,v in pairs(m.cassettes) do 
						emu.print_info("Tape device: " .. i)
						d = i
						break
					end

					if d == nil then
						emu.print_error("Could not determine cassette device, exiting")
						os.exit()
					end

					t = m.cassettes[d]
					s = filename(m.images[d].filename)
					st = tapeloader_softwareinfo(s, emu.romname())
					if st == nil then 
						emu.print_error("Failed to load tape index data")
						os.exit()
					end
				end
			end
		end)

	-- register callback at end of frame
	emu.register_periodic(
		function()
			if st == false then return end
			if t then
				for index,v in pairs(st) do
					t_report = math.floor(t.position)
					if t.position >= tonumber(index) and t.position <= tonumber(index)+1 then
						--print(command, t.position, t.is_playing)
						command = st[index]
						if command ~= last_command then
							last_command = command

							-- stop
							local stop_command = string.match(command, "(" .. kw_stop .. ")")
							if stop_command ~= nil then
								if fastloading then stop_fastload() end
								command = command:gsub("%" .. kw_stop, "")
							end

              -- position
							local pos_index = string.match(command, kw_pos .. "([0-9]+)")
							if tonumber(pos_index) ~= nil then
								emu.print_info("Moving to index: " .. pos_index )
								t:seek(pos_index,"set")
								command = command:gsub("%" .. kw_pos .. "([0-9]+)", "")
							end

							-- forward
							if string.match(command, "(" .. kw_fwd .. ")") then
								emu.print_info("Tape direction: forward")
								t:forward()
								command = command:gsub("%" .. kw_fwd, "")
							end

							-- rewind
							if string.match(command, "(" .. kw_rev .. ")") then
								emu.print_info("Tape direction: reverse")
								t:reverse()
								command = command:gsub("%" .. kw_rev, "")
							end

							-- start
							local start_command = string.match(command, "(" .. kw_start .. ")")
							if start_command ~= nil then
								if not fastloading then start_fastload() end
								command = command:gsub("%" .. kw_start, "")
							end

							-- padding, this is a hack to workaround slow for input
							local space_index = string.match(command, kw_space .. "([0-9]+)")
							if tonumber(space_index) ~= nil then
								emu.print_info("Padding with ".. space_index .. " spaces")
								command = command:gsub("%" .. kw_space .. "([0-9]+)", string.rep(" ",space_index))
							end

							-- send command
							if string.len(command) > 0 then 
								emu.print_info("Sending command: \"".. command .."\" (" .. t_report .. ")")

								--command = command:gsub("%&s8", "        ") -- this is a hack to workaround the weird delay for input
								command = command:gsub("%" .. kw_space, " ")
								command = command:gsub("%" .. kw_lf, "\n")
								command = command:gsub("%" .. kw_cr, "\r")

								emu.keypost(command) 
							end
						end
					end
				end
			end
		end)

end

return exports
