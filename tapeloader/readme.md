## install
these files should exist in `homepath` (see `mame.ini`) `tapeloader` directory

## syntax
games are linked to machines to address duplicate names across softlists

### tape_index
```
game;machine;idx,command^idx,command^idx,&stop
```

- `&start` or `&stop`, can be used to start/stop throttling, volume, frameskip
- `&n` or `&r`, will be substituted for the `\n` & `\r` respectvely
- `&s` will be substituted with a space
- `&s(n)` is a special case that will be replaced with (n) spaces, padding for slow input (e.g &s8 equals 8 spaces)
- `&pos` will move the to the position (+/- the internal counter increment)
- `&fwd` tape direction forward
- `&rev` tape direction backward

the rest are system commands, so on the c64 input `load` or `run` at the documented tape indexes

if there is a loader or cracktro etc you can have it press space. how well it goes with trainers is unknown

### examples
wizball on c64
```
wizball;c64p;0,&start^1,load&n^320,&stop
```
- at index 1
 - disable throttling, sound and enable frameskip 
 - type load and press enter
- at index 320
 - enable throttling, sound and disable frameskip 

bruce lee on cpc6128
```
brucelee;cpc6128;0,&start&s8|tape&nload"*"&n &n^221,&stop
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

### create a profile
1. start the MAME machine with the cassette attached
2. enter required commands to load the device
3. press scroll-lock (uimodekey) to enable ui controls
4. press f2 to begin playback
5. track the tape index stop point* and keys used to continue
6. enter details into tape_index.txt

*when the tape stops while the machine is waiting for input check the tape control menu in the ui for the resting index


#### limitations/todo/notes
* no joystick/modifier key support yet
* seek seems to be influenced by some internal increment, so need to keep that in mind id rewinding
* can only use a keyword once per block i.e this is a block: ^___^
* `&start` needs to be called at index 0 for devices that don't engage the cassette motor automatically
* ???