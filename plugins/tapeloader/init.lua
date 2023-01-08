-- license:BSD-3-Clause
-- copyright-holders:sairuk, danmons

local exports = {
	name = 'tapeloader',
	version = '0.0.1',
	description = 'disable throttling, enable frameskip until (n) tape index',
	license = 'BSD-3-Clause',
	author = { name = 'sairuk' } }

local tapeloader = exports

function tapeloader.startplugin()
	local emu_start_time = 0
	local period = 60
	local t
	local m
	local play = false
	local s = ""

	-- basd on timecode plugin
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
		for line in tl_software_data:lines() do
			game,index = string.match(line, "(.+);(.+)")
			if game == s then
				return tonumber(index)
			end
		end
		return false
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
					t.speaker_state = true

					-- speed up emulation for tape loading
					m.video.throttled = false
					m.video.frameskip = 10
					mame_manager.ui.show_fps = true

				end
			end
			period = tapeloader_softwareinfo(s) or period
			print("Tape Index: " .. period)
		end)



	-- register callback at end of frame
	emu.register_periodic(
		function()
			if t
			then
				if t.position == 0
				then
					emu.keypost("load\n")
					play = true
				end

				if t.is_playing and t.position > ( period - 1 )
				then
					m.video.throttled = true
					m.video.frameskip = 0
					mame_manager.ui.show_fps = false
				end

				if play
				then
					t:play()
				end
			end
		end)

end

return exports
