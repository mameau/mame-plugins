-- license:BSD-3-Clause
-- copyright-holders:sairuk

-- generate portmap data use with auto486auto

local exports = {
	name = 'act486pm',
	version = '0.0.1',
	description = 'act486 generate portmap',
	license = 'BSD-3-Clause',
	author = { name = 'sairuk' } }

local act486pm = exports
local reset_subscription
local frame_subscription

function act486pm.startplugin()

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
      print("portmap = {")
      for pn, p in pairs(manager.machine.ioport.ports) do
        print("\t-- " .. pn)
        for fn, f in pairs(manager.machine.ioport.ports[pn].fields) do
          keycode = manager.machine.input:seq_to_tokens(f:default_input_seq('standard'))
          for code in string.gmatch(keycode, "[^%s]+") do
            if code ~= "" and code ~= "OR" and fn ~= "Keyboard" then
              print('\t["' .. code .. '"] = { "' .. pn ..'", "' .. fn .. '" },') 
            end
          end
        end
      end
      print("}")
      frame_subscription:unsubscribe()
      manager.machine:exit()
    end
  emu.register_frame_done()
  end)

end

return exports

