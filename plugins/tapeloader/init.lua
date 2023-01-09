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
	local emu_start_time = 0
	local period = 60
	local st
	local t
	local m
	local done = false
	local s = ""


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

	local function tapeloader_getfile(f)
		local path = get_settings_path()
		local attr = lfs.attributes(path)
		if not attr then
			lfs.mkdir(path)
		end
		return io.open(path .. '/' .. f, "r")
	end

	local function tapeloader_machineinfo(tl_m)
		tl_machine_data = tapeloader_getfile("machine.txt")
		for line in tl_machine_data:lines() do
			machine,device = string.match(line, "(.+);(.+)")
			if machine == tl_m then
				return device
			end
		end
	end

	local function tapeloader_softwareinfo(s)
		tl_software_data = tapeloader_getfile("tape_index.txt")
		tl_playscript = {}
		for line in tl_software_data:lines() do
			game,script = string.match(line, "(.+);(.+)")
			if game == s then
				print("Found game entry: " .. game)
				entries = string.gmatch(script, "([^\\^]+)")
				for entry in entries do
					index,command = string.match(entry, "(.+),(.+)")
					tl_playscript[index] = command
				end
				return tl_playscript
			end
		end
		return tl_playscript
	end

	-- register callback after reset
	emu.register_start(
		function()
			if emu.romname() ~= '___empty' then
				if emu.softname() ~= '___empty' then
					--emu_start_time = emu.time()
					m = manager.machine
					d = tapeloader_machineinfo(emu.romname())
					t = m.cassettes[d]
					s = m.images[d].filename
					st = tapeloader_softwareinfo(s)
				end
			end

			-- lua, lua, lua, get last index because st[#st] doesn't work, pairs is also unordered
			st_period = false
			for i,v in pairs(st) do
				if v == "done" then
					st_period = i
				end
			end

			period = st_period or period
			print("Tape loaded target index is: " .. period)

			if st then
				-- speed up emulation for tape loading
				m.video.throttled = false
				m.video.frameskip = 10
				mame_manager.ui.show_fps = true
				manager.machine.sound.ui_mute = true
			end

		end)



	-- register callback at end of frame
	emu.register_periodic(
		function()
			if done == true then return end
			if st == false then return end
			if t then
				t_report = math.floor(t.position)

				if t.is_playing and t.position > ( period - 1 ) then
					m.video.throttled = true
					m.video.frameskip = 0
					mame_manager.ui.show_fps = false
					manager.machine.sound.ui_mute = false
					if not done then
						print("Finished load (" .. t_report .. ")")
						done = true
					end
					return
				else
					for index,v in pairs(st) do						
						if t.position >= tonumber(index) and t.position <= tonumber(index)+1 then
							--print(command, t.position, t.is_playing)
							command = st[index]
							if command ~= last_command then
								if command ~= "done" then
									print("Sending command: \"".. command .."\" (" .. t_report .. ") (" .. tonumber(index) .. "<->" .. tonumber(index)+1 .. ")")
									last_command = command											
									if command == "run" then
										-- this is a hack to workaround the weird delay for input
										command = "        " .. command
									end
									emu.keypost(command .. "\n")
								end
							end
						end
					end
				end
				if not t.is_playing then t:play() end
			end
		end)

end

return exports
