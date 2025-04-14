-- license:BSD-3-Clause
-- copyright-holders:sairuk

-- record input for use with auto486auto

local exports = {
	name = 'act486keyb',
	version = '0.0.1',
	description = 'act486 generate keymap',
	license = 'BSD-3-Clause',
	author = { name = 'sairuk' } }

local act486keyb = exports
local reset_subscription
local frame_subscription

function act486keyb.startplugin()

  local t = {}
  local frame = 0
  local lframe = 0
  local rport = false
  local dtokens = ""

  reset_subscription = emu.add_machine_reset_notifier(function()
    i = manager.machine.input
  end)

  -- for i,v in pairs(manager.machine.images) do print(i) end
  frame_subscription = emu.add_machine_frame_notifier(function()
    if manager.machine.time.seconds > 0 then
      for pn, p in pairs(manager.machine.ioport.ports) do
        keyb = string.match(pn, ":.+keyb.+")
        if keyb ~= nil then
          for fn, f in pairs(manager.machine.ioport.ports[keyb].fields) do
            keycode = manager.machine.input:seq_to_tokens(f:input_seq('standard'))
            print('["' .. keycode .. '"] = { "' .. keyb ..'", "' .. fn .. '" },') 
          end
        end
      end
      frame_subscription:unsubscribe()
      manager.machine:exit()
    end
  emu.register_frame_done()
  end)

end

return exports

