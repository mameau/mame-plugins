-- license:BSD-3-Clause
-- copyright-holders:sairuk


-- maybe should have used natkeyboard but i was in too deep

local exports = {
	name = 'act486auto',
	version = '0.0.1',
	description = 'act486 auto config demo',
	license = 'BSD-3-Clause',
	author = { name = 'sairuk' } }

local act486auto = exports
local reset_subscription
local frame_subscription

-- https://www.reddit.com/r/MAME/comments/1aw9h7c/comment/ksow3uj/
local function press(port,field)
  manager.machine.ioport.ports[port].fields[field]:set_value(1)
end

local function release(port,field)
  manager.machine.ioport.ports[port].fields[field]:clear_value()
end

local function attach_image(tag, software)
  manager.machine.images[tag]:load_software(software)
end

local function detach_image(tag)
  manager.machine.images[tag]:unload()
end

local function nothrottle()
  manager.machine.video.throttled = false
	manager.machine.video.frameskip = 10
end

local function throttle()
  manager.machine.video.throttled = true
	manager.machine.video.frameskip = 0
end

local function exit()
  manager.machine:exit()
end

local function draw_hud(frame, fstart, fend, comment)
  print(frame, fstart, fend, comment)
  --manager.machine.screens[":isa1:svga_et4k:screen"]:draw_text(200, 3, string.format("%s", frame),  0xffffffff, 0xff000000)
end

function act486auto.startplugin()

  local t = {}
  local frame = 0
  local rport = false

  require(exports.name .. '/portmap')

  reset_subscription = emu.add_machine_reset_notifier(function()

    if emu.romname() ~= '___empty' then
      if emu.softname() ~= '___empty' then

        -- hackeryd00
        local machscript = exports.name .. '/scripts/' .. emu.romname()
        local machfile = manager.machine.options.entries.pluginspath:value():match("([^;]+)") .. "/" .. machscript .. ".lua"
        local machtest = io.open(os.getenv("HOME") .. "/.mame/" .. machfile, "r")
        -- hackeryd00x2
        local softscript = exports.name .. '/scripts/' .. emu.softname()
        local softfile = manager.machine.options.entries.pluginspath:value():match("([^;]+)") .. "/" .. softscript .. ".lua"
        local softtest = io.open(os.getenv("HOME") .. "/.mame/" .. softfile, "r")

        -- machine script
        if machtest then
          io.close(machtest)
          require(machscript)
          for k,v in pairs(t_machine) do
            table.insert(t, v)
          end
        else
          print("Unsupported machine")
          exit()
        end

        -- software script
        if softtest then
          io.close(softtest)
          require(softscript)
          for k,v in pairs(t_software) do
            table.insert(t, v)
          end
        end

        -- preprocess imports
        for tk, tv in pairs(t) do
          tfield = tv[3]
          if string.match(tfield, "import_") then
            import = string.gsub(tfield, "import_(.+)", "%1")
            require(exports.name .. "/scripts/" .. import)
            table.remove(t, tk)
            for tdk, tdv in pairs(t_step) do
              idx = tk + (tdk - 1)
              table.insert(t, idx, tdv)
            end
          end
        end
        nothrottle()
      end
    end
  end)

  -- for i,v in pairs(manager.machine.images) do print(i) end
  frame_subscription = emu.add_machine_frame_notifier(function()
    if manager.machine.time.seconds > 0 then
      fstart = start

      for tk, tv in pairs(t) do
        tfield = tv[3]
        comment = tv[4]

        fstart = fstart + tv[1]
        fend = fstart + tv[2]

        draw_hud(frame, fstart, fend, comment)
        
        if frame == fstart then

          -- attach images
          if string.match(tfield, "eject_") then
            softdev = string.gsub(tfield, "eject_(.+)", "%1")
            detach_image(tags[softdev])
          elseif string.match(tfield, "attach_") then 
            softdev = string.gsub(tfield, "attach_(.+)_(.+)", "%1")
            softimg = string.gsub(tfield, "attach_(.+)_(.+)", "%2")
            attach_image(tags[softdev], software .. ":" .. softimg)
          elseif string.match(tfield, "throttle") then
            throttle()
          elseif string.match(tfield, "stop") then
            exit()
          else
            port = portmap[tfield][1]
            field = portmap[tfield][2]

            --print(frame, tfield, port, field)

            -- press key
            if rport == false then
              press(port,field)
              rport = true
            end
          end
        end

        -- release pressed keys
        if rport and frame == fend then
          release(port,field)
          rport = false
        end

      end
      frame = frame + 1
    end
      
  end)

end

return exports
