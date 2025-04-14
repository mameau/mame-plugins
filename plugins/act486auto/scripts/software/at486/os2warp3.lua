-- this currently crashes during install, needs more work
software = "os2warp3"
chd = "import_dev_hdd_1G"

t_software = {
  { 10, 5, "import_pcipc", "Import machine" },
  { 10, 10, "attach_flop1_flop1", "Insert Installation Disk" },
  { 2000, 10, "attach_cdrom1_cdrom1", "Insert CDROM ATAPI" },
  { 1500, 10, "attach_flop1_flop2", "Insert Diskette 1" },
  { 10, 10, "KEYCODE_ENTER", "" },
--  { 6500, 10, "KEYCODE_E", "Easy Installation" },
  { 6500, 10, "KEYCODE_A", "Advanced Installation" },
  { 100, 10, "KEYCODE_ENTER", "HPFS" },
  { 5600, 5, "eject_flop1", "Empty Floppy Disk Drive 1" },
  { 100, 10, "KEYCODE_ENTER", "Restart after install" },
  { 3700, 10, "KEYCODE_LALT,KEYCODE_O", "Continue Install" },
  { 300, 10, "KEYCODE_LALT,KEYCODE_O", "" },
  { 300, 10, "KEYCODE_LALT,KEYCODE_I", "" },
  { 300, 10, "KEYCODE_LALT,KEYCODE_O", "" },
  { 21000, 10, "KEYCODE_TAB,KEYCODE_ENTER", "" },
  { 10, 10, "reset", "" },
  { 900, 10, "throttle", "Throttle for boot" },
}
