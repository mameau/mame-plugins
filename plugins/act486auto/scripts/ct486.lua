start = 900
keymap = "ms_naturl"

tags = {
  screen1 = ":isa1:svga_et4k:screen",
  flop1 = ":board1:fdcsmc:fdc:0:35hd",
  flop2 = ":board1:fdcsmc:fdc:1:35hd",
  hard1 = ":board3:ide:ide:0:hdd:image",
  cdrom1 = ":board3:ide:ide:1:cdrom:image",
}

t_step = {
  { 100, 10, "KEYCODE_F1", "Enter Bios" },
  { 100, 5, "KEYCODE_ENTER", "Standard CMOS Setup" },
  { 10, 5, "KEYCODE_RIGHT", "" },
  { 10, 5, "KEYCODE_RIGHT", "" },
  { 10, 5, "KEYCODE_RIGHT", "" },
  { 10, 5, "KEYCODE_RIGHT", "" },
  { 10, 5, "KEYCODE_RIGHT", "" },
  { 10, 5, "KEYCODE_RIGHT", "" },
  { 10, 5, "KEYCODE_RIGHT", "" },
  { 100, 5, "import_dev_hdd_1G", "Import HDD Type" },
  { 10, 5, "KEYCODE_RIGHT", "" },
  { 10, 5, "KEYCODE_PGUP", "Configure Floppy Drives" },
  { 10, 5, "import_dev_fd_144", "Import Floppy Drive" },
  { 10, 5, "KEYCODE_PGUP", "" },
  { 10, 5, "import_dev_fd_144", "Import Floppy Drive" },
  { 10, 10, "KEYCODE_ESC", "Exit Standard CMOS Setup" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 20, 10, "KEYCODE_ENTER", "Enter Advanced CMOS Setup" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_DOWN", "" },
  { 10, 5,  "KEYCODE_PGUP", "Set Boot Order" },
  --{ 10, 5000, "pause", "Pause Emulator"},
  { 10, 10, "KEYCODE_ESC", "Exit Advanced CMOS Setup" },
  { 10, 5,  "KEYCODE_F10", "Save and Exit" },
  { 10, 5,  "KEYCODE_Y", "" },
  { 10, 10, "KEYCODE_ENTER", "" },
}
