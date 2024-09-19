# act486auto

offset (frame) based automation for MAME machines, it is all pretty rough and was built initially for use with at486 and ct486 machines

# setup
in `scripts/`
* machine  -> create a `machine.lua` with a `t_machine` table
* software -> create a `software.lua` with a `t_software` table

set any vars your machine or software needs in the respective files with desired scope

the `t_` tables row format is `{ offset, delay, portmap, "comment" },`

offsets are offset from 0 based on a start delay per machine, `900` for at486 it is not true frames as we only start after machine time starts

## commands
* see `portmap.lua` for available key commands
* `stop` and `throttle` are special keywords
* `fd0_softlist_dev` will insert `flop(n)` into floppy drive 1

perhaps we should use machine time and natkeyboard, perhaps seconds is enough, perhaps more commands and devices should be supported, perhaps later we will

sai
