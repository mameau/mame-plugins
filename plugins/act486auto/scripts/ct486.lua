start = 900
tags = {
  screen1 = ":isa1:svga_et4k:screen",
  flop1 = ":board1:fdcsmc:fdc:0:35hd",
  flop2 = ":board1:fdcsmc:fdc:1:35hd",
  hard1 = ":board3:ide:ide:0:hdd:image",
  cdrom1 = ":board3:ide:ide:1:cdrom:image",
}

t_machine = {
  { 100, 10, "KEY_F1", "Enter Bios" },
  { 100, 90, "KEY_ENTER", "Standard CMOS Setup" },
  { 100, 5, "import_dev_hdd_1G", "Import HDD Type" },
  { 10, 5, "KEY_PGUP", "Configure Floppy Drives" },
  { 10, 5, "import_dev_fd_144", "Import Floppy Drive" },
  { 10, 5, "KEY_PGUP", "" },
  { 10, 5, "import_dev_fd_144", "Import Floppy Drive" },
  { 10, 10, "KEY_ESC", "Exit Standard CMOS Setup" },
  { 10, 5,  "KEY_DOWN", "" },
  { 20, 10, "KEY_ENTER", "Enter Advanced CMOS Setup" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  { 10, 5,  "KEY_DOWN", "" },
  --{ 10, 5,  "KEY_PGUP", "Set Boot Order" },
  { 10, 10, "KEY_ESC", "Exit Advanced CMOS Setup" },
  { 10, 5,  "KEY_F10", "Save and Exit" },
  { 10, 5,  "KEY_Y", "" },
  { 10, 10, "KEY_ENTER", "" },
}