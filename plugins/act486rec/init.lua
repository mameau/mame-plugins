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

function act486auto.startplugin()

  local t = {}
  local frame = 0
  local lframe = 0
  local rport = false
  local dtokens = ""

  reset_subscription = emu.add_machine_reset_notifier(function()
    i = manager.machine.input
    ik = i:keyboard_code_poller()
    ik:reset()
  end)

  -- for i,v in pairs(manager.machine.images) do print(i) end
  frame_subscription = emu.add_machine_frame_notifier(function()
    if manager.machine.time.seconds > 0 then
      p = ik:poll()

      -- first time pressed, add to stack
      if i:code_pressed(p) then
        if t[p] == nil then
          lframe = 0
          dframe = 0
          t[p] = { frame, lframe }
        end

      end
    end
    if #t then
      -- are any of these still pressed?
      for k, v in pairs(t) do
        if i:code_value(k) ~= 0 then
          t[k] = { frame, lframe }
          dframe = dframe + 1
        else
          t[k] = nil
        end
      end

      tokens = ""
      for k, v in pairs(t) do
        tokens = tokens .. "," .. i:code_to_token(k)
      end

      if tokens ~= "" and lframe == 1 then
        print('{ ' .. lframe .. ',' .. dframe .. '"' .. tokens .. '", "" },')
      end
    end
    lframe = lframe + 1
    frame = frame + 1
  end)
  emu.register_frame_done()

end

return exports
