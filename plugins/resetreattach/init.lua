-- license:BSD-3-Clause
-- copyright-holders:sairuk
local exports = {
        name = 'resetreattach',
        version = '0.0.1',
        description = 'Re-attach media on reset',
        license = 'BSD-3-Clause',
        author = { name = 'sairuk' } }

local resetreattach = exports
local reset_subscription

-- intended for use with x68k_flop
-- note: x68k requires hard reset
--

function resetreattach.startplugin()
  local rdev = {}
  local poprd = true

  -- lua sort docs https://www.lua.org/pil/19.3.html
  -- consistent data for attaching the flop index 
  local function pairsByKeys (t, f)
      local a = {}
      for n in pairs(t) do table.insert(a, n) end
      table.sort(a, f)
      local i = 0      -- iterator variable
      local iter = function ()   -- iterator function
          i = i + 1
          if a[i] == nil then return nil
          else return a[i], t[a[i]]
          end
      end
      return iter
  end


  reset_subscription = emu.add_machine_reset_notifier(function()

    if emu.softname() ~= '___empty' or emu.softname ~= resoft then
      for name, image in pairsByKeys(manager.machine.images) do
        if image.filename ~= nil then
          if poprd then
            rdev[name] = image.filename
          end
        end
      end
      poprd = false
      n = 0
      for name, filename in pairsByKeys(rdev) do
        n = n + 1
        manager.machine.images[name]:unload()
        manager.machine.images[name]:load_software(filename .. ":flop" .. n)
      end

    end
  end)

end

return exports