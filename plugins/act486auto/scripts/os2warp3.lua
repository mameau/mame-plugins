-- this currently crashes during install, needs more work
software = "os2warp3"

t_software = {
  { 10, 10, "attach_flop1_flop1", "Insert Installation Disk" },
  { 2000, 10, "attach_cdrom1_cdrom1", "Insert CDROM ATAPI" },
  { 1500, 10, "attach_flop1_flop2", "Insert Diskette 1" },
  { 10, 10, "KEY_ENTER", "" },
--  { 6500, 10, "KEY_ENTER", "" },
  { 6500, 10, "KEY_A", "" },
  { 20, 10, "KEY_A", "" },
  { 80, 10, "KEY_F", "" },
  { 20, 10, "KEY_ENTER", "" },
  { 5200, 5, "eject_flop1", "Empty Floppy Disk Drive 1" },
  { 10, 5, "eject_flop2", "Empty Floppy Disk Drive 2" },
  { 10, 5, "eject_cdrom1", "Empty Floppy Disk Drive" },
  { 10, 10, "KEY_ENTER", "Installer finised" },
  { 3000, 10, "throttle", "Throttle" },
  { 10, 10, "stop", "Exit" },
}
