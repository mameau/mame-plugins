-- license:BSD-3-Clause
-- copyright-holders:sairuk
-- https://github.com/mamedev/mame/blob/master/src/frontend/mame/luaengine.cpp

local exports = {
	name = 'benchmark',
	version = '0.0.1',
	description = 'Game play benchmark',
	license = 'BSD-3-Clause',
	author = { name = 'sairuk' } }

local benchmark = exports

function benchmark.startplugin()
	local start_time = 0
	local end_time = 0

	local emu_romname = ""
	local emu_app_version = ""
	local emu_start_time = ""
	local emu_current_time = ""

	local m_speed_last_realtime = 0
	local m_speed_last_emutime = 0
	local m_overall_real_ticks = 0
	local tps = 0

	-- register callback after reset
	emu.register_start(
		function()
			if emu.romname() ~= '___empty' then
				start_time = os.time()
				emu_start_time = emu.time()
				emu_romname = emu.romname()
				emu_app_version = emu.app_version()
				start_bench = true
			end
		end)

	-- register callback periodic
	emu.register_periodic(
		function()
			if start_bench then
				local emutime = emu.time()
				local realtime = emu.osd_ticks()
				local delta_realtime = realtime - m_speed_last_realtime
				local delta_emutime = emutime - m_speed_last_emutime

				tps = emu.osd_ticks_per_second()
				m_speed_last_realtime = realtime;
				m_speed_last_emutime = emutime
				m_overall_real_ticks = realtime

				local m_speed_percent = delta_emutime * tps / delta_realtime;
                                local current_real_time = manager.machine.time.seconds + realtime / tps
                                local current_emu_time = emutime

				local out_string = string.format(_p('%s,%s,%.2f%%,%s'),
					emu_app_version,
					emu_romname,
					100 * m_speed_percent,
					manager.machine.time.seconds
				)

				print(out_string)
			end

		end)

    -- register callback after stopping
	emu.register_stop(
		function()
			if emu.romname() ~= '___empty' then
				local m_overall_real_seconds = manager.machine.time.seconds
				local final_real_time = m_overall_real_seconds + m_overall_real_ticks / tps
				local avg_speed = string.format(_p("Average speed:  %.2f%% (%d seconds)"),final_real_time,manager.machine.time.seconds)
				--print(avg_speed)

				end_time = os.time()
			end
		end)

end

return exports
