# act486auto

offset (frame) based automation for MAME machines, it is all pretty rough and was built initially for use with at486 and ct486 machines and msdos622 as a demo.

# setup
in `scripts/`
* machine  -> create a `machine.lua` with a `t_machine` and `tags` table
* software -> create a `software.lua` with a `t_software` table

set any vars your machine or software needs in the respective files with desired scope

the `t_` tables row format is `{ offset, delay, portmap, "comment" },`

offsets are offset from 0 based on a start delay per machine, `900` for at486 it is not true frames as we only start after machine time starts

## commands
* see `portmap/<portmap>.lua` for available key commands
* `stop` and `throttle` are special keywords
* `attach_<softdev>_<port>` will insert whatever media into port as referenced from `tags`
* `import_<file base name>` will preprocess steps from `t_step` table

## usage
msdos622 to blank chd image of CHS `2048,16,63` (1G)
`mame -w at486 -nonvram_save -skip_gameinfo -plugins -plugin act486auto -ramsize 64M msdos622 -hard1 harddisk/msdos622.chd `

os2 with a cdrom device to blank 1G chd
`./mame -w at486 -nonvram_save -skip_gameinfo -plugins -plugin act486auto -ramsize 64M os2warp3 -hard1 harddisk/os2warp3.chd -board3:ide:ide:1 cdrom -cdrom os2warp3 `

freedos1.3 floppy edition on pcipc with 256M ram to blank 1G chd
`./mame -w pcipc -nomax -nonvram_save -skip_gameinfo -ramsize 256M -plugins -plugin act486auto freedos13_144 -hard1 harddisk/freedos13_144.chd`

```
Average speed: 95.27% (1817 seconds)

real	31m51.243s
user	31m47.315s
sys	0m11.089s
```

## reference
use the plugins
* act486pm - create a portmap for a system
* act486rec - record a session for playback
