## install
these files should exist in `homepath` (see `mame.ini`) `tapeloader` directory

## syntax
games are linked to machines to address duplicate names across softlists

### tape_index
```
game;machine;idx,command^idx,command^idx,done
```

- `done`, can be anything it is the index that reinstates throttling, volume and reduces frameskip
- `&n` or `&r`, will be substituted for the `\n` & `\r` respectvely
- `&s` will be substituted with a space
- `&s8` is a special case that will be replaced with 8 spaces, its a hack for slow input

the rest are system commands, so on the c64 `load` or `run` at the documented tape indexes

if there is a loader or cracktro etc you can have it press space. how well it goes with trainers is unknown

### examples
wizball on c64
```
wizball;c64p;1,load&n^320,done
```
- at index 1
 - disable throttling, sound and enable frameskip 
 - type load and press enter
- at index 320
 - enable throttling, sound and disable frameskip 

bruce lee on cpc6128
```
brucelee;cpc6128;0,&s8|tape&nload"*"&n &n^221,done
```
- at index 0
 - disable throttling, sound and enable frameskip 
 - type 8 spaces then |tape and press enter
 - type load"*"
 - type a space
- at index 221
 - enable throttling, sound and disable frameskip 


### running systems
c64
```
mame c64p -w -cass wizball -plugins -plugin tapeloader
```

cpc6128
```
mame cpc6128 -cass brucelee -w -plugins -plugin tapeloader
```

sc30000
```
mame sc3000h -w -nomax -cart basic3 -cass voltron -plugins -plugin tapeloader
```



### ~finding cassette devices~ this is now automated
start MAME with the lua console
```
mame c64 -console -w
```

in the console list the devices and find the cassette device
```
for i,v in pairs(manager.machine.cassettes) do print(i) end
:tape:c1530:cassette
```
