## about

Will re-attach media to the MAME x68k machine at startup/reset (may work with others). 

this plugins scans the launch images builds a temporary global table of the devices and images then replays the temporary table at machine start/

supports multi-disk titles, these get mounted with \<softname\>:flop\<idx\> as registered in the softlist.

## usage
once installed can be activated with:

```
./mame x68000 akumajo -plugins -plugin resetreattach
```