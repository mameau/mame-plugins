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
local poll_subscription

-- intended for use with x68k_flop
-- might work for other systems, but limited success

function resetreattach.startplugin()
  local rdev = {}
  local poprd = true
  local deviceException = { 'cdrom', 'quickload' }

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

  -- trim the string back to 4chars, this wont work for everything 
  -- and needs an exception list
  local function shortName(s)
    return string.sub(s,0,4)
  end

  -- override soft reset and force a hard reset
  local function hreset()
    if not manager.ui.ui_active then
      emu.print_info(exports["name"] .. ": Hard Reset from plugin")
      manager.machine:hard_reset()
    end
  end

  local function deviceExempt(d)
    for device in pairs(deviceException) do
      if d == device then
        return true
      end
      return false
    end
  end

  -- poll_subscription = emu.add_machine_frame_notifier(function()
  --   local machine = manager.machine
  --   local ui_reset = machine.ioport:token_to_input_type('UI_SOFT_RESET')
  --   local uiinput = machine.uiinput

  --   if uiinput:pressed(ui_reset) then
  --     -- force a hard reset but doesn't work
  --     uiinput:reset()
  --     hreset()
  --   end
  -- end)

  reset_subscription = emu.add_machine_reset_notifier(function()

    ---- if ui is active at start exit so we dont get in a loop
    -- if manager.ui.ui_active then
    --   emu.print_error(exports["name"] .. ": ui is active, unloading plugin to avoid looping")
    --   return
    -- end
 
    -- hreset()

    if emu.softname() ~= '___empty' or emu.softname ~= resoft then
      for name, image in pairsByKeys(manager.machine.images) do
        if image.filename ~= nil then
          if poprd then
            rdev[name] = { fimage = image.filename, ftype = image.image_type_name }
          end
        end
      end
      poprd = falses
      n = 0
      for name, filename in pairsByKeys(rdev) do
        manager.machine.images[name]:unload()

        -- check exemptions
        if not deviceExempt(filename["ftype"]) then
          n = n + 1
          software = filename["fimage"] .. ":" .. shortName(filename["ftype"]) .. n
        else
          software = filename["fimage"] .. ":" .. filename["ftype"]
        end
        
        manager.machine.images[name]:load_software(software)
      end
    end
  end)
end

return exports