software = "msdos622"

  -- offset, release delay, portmap, comment
t_software = {
  -- MSDOS 622
  { 10, 10, "fd0_flop1", "Insert Floppy Disk 1" },
  { 2500, 10, "ENTER", "" },
  { 100, 10, "ENTER", "" },
  { 100, 10, "ENTER", "" },
  { 100, 10, "ENTER", "" },
  { 2800, 10, "ENTER", "" },
  { 100, 10, "ENTER", "" },
  { 6900, 10, "fd0_flop2", "Insert Floppy Disk 2" },
  { 100, 10, "ENTER", ""  },
  { 10000, 10, "fd0_flop3", "Insert Floppy Disk 3"  },
  { 100, 10, "ENTER", "" },
  { 9000, 10, "ENTER", "" },
  { 100, 10, "ENTER", "" },
  { 500, 5, "fd0_eject", "Empty Floppy Disk Drive" },

  { 3000, 10, "throttle", "Throttle" },
  { 10, 10, "stop", "Exit" },
}