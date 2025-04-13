-- license:BSD-3-Clause
-- copyright-holders:sairuk

-- record input for use with auto486auto

local exports = {
	name = 'act486rec',
	version = '0.0.1',
	description = 'act486 auto config recorder',
	license = 'BSD-3-Clause',
	author = { name = 'sairuk' } }

local act486auto = exports
local reset_subscription
local frame_subscription
local frame = 0
local lframe = 0

function act486auto.startplugin()

  local t
  local rport = false

  reset_subscription = emu.add_machine_reset_notifier(function()
    i = manager.machine.input
    ik = i:keyboard_code_poller()
    ik:reset()
  end)

  -- for i,v in pairs(manager.machine.images) do print(i) end
  frame_subscription = emu.add_machine_frame_notifier(function()
    if manager.machine.time.seconds > 0 then
      fstart = start
      k = ik:poll()
      action = false
      if i:code_pressed(k) then
        action = true
        token = i:code_to_token(k)
      end
    end
    if action then
      print('{ ' .. lframe .. ', 5, "' .. token .. '", "" },')
      lframe = 0
    end
    lframe = lframe + 1
    frame = frame + 1
  end)
  emu.register_frame_done()

end

return exports
