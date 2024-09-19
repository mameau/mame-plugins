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
function press(port,field)
  manager.machine.ioport.ports[port].fields[field]:set_value(1)
end

function release(port,field)
  manager.machine.ioport.ports[port].fields[field]:clear_value()
end

function attach_soft(tag, software)
  manager.machine.images[tag]:load_software(software)
end

function detach_soft(tag)
  manager.machine.images[tag]:unload()
end

function nothrottle()
  manager.machine.video.throttled = false
	manager.machine.video.frameskip = 10
end

function throttle()
  manager.machine.video.throttled = true
	manager.machine.video.frameskip = 0
end

function act486auto.startplugin()

  local t = {}
  local frame = 0
  local rport = false

  require('act486auto/portmap')

  reset_subscription = emu.add_machine_reset_notifier(function()

    if emu.romname() ~= '___empty' then
      if emu.softname() ~= '___empty' then

        require('act486auto/scripts/' .. emu.romname())
        require('act486auto/scripts/' .. emu.softname())

        -- machine script
        for k,v in pairs(t_machine) do
          table.insert(t, v)
        end

        -- software script
        for k,v in pairs(t_software) do
          table.insert(t, v)
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

        print(frame, fstart, fend, comment)
        
        if frame == fstart then
          -- attach images
          if string.match(tfield, "fd0") then 
              softimg = string.gsub(tfield, "fd0_(.+)", "%1")
              if softimg == "eject" then
                detach_soft(flop1)
              else
                attach_soft(flop1, software .. ":" .. softimg)
              end
          elseif string.match(tfield, "throttle") then
            throttle()
          elseif string.match(tfield, "stop") then
            manager.machine:exit()
          else
            port = portmap[tfield][1]
            field = portmap[tfield][2]

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
