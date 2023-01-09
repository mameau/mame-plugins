## install
these files should exist in `homepath` (see `mame.ini`) `tapeloader` directory

## syntax

### machine
machine driver and slot device
```
driver;tape:slot:device
```

### tape_index
```
game;idx,command^idx,command^idx,done
```

- "done", can be anything it is the index that reinstates throttling, volume and reduces frameskip

the rest are system commands, so on the c64 `load` or `run` at the documented tape indexes

if there is a loader or cracktro etc you can have it press space. how well it goes with trainers is unknown
