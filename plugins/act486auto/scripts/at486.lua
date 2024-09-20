start = 900
flop1 = ":board1:fdcsmc:fdc:0:35hd"
hdd = ":board3:ide:ide:0:hdd:image"
cdrom = ":board3:ide:ide:1:cdrom:image"

  -- offset, release delay, portmap, comment
t_machine = {
  -- Enter Bios
  { 100, 10, "F1", "Enter Bios" },
  -- Standard CMOS Setup
  { 100, 90, "ENTER", "Standard CMOS Setup" },
  { 100, 5, "import_dev_hdd_1G", "Import HDD Type" },
  -- Floppies
  { 10, 5, "DOWN", "Configure Floppy Drives" },
  ---- Drive A
  { 10, 5, "import_dev_fd_144", "Import Floppy Drive" },
  ---- Drive B
  { 10, 5, "import_dev_fd_144", "Import Floppy Drive" },
  -- Exit Standard CMOS Setup
  { 10, 10, "ESC", "Exit Standard CMOS Setup" },

  -- Advanced CMOS Setup
  { 10, 5,  "DOWN", "" },
  { 20, 10, "ENTER", "Enter Advanced CMOS Setup" },
  --
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  { 10, 5,  "DOWN", "" },
  -- Boot Order
  { 10, 5,  "PGUP", "Set Boot Order" },
  -- Exit Advanced CMOS Setup
  { 10, 10, "ESC", "Exit Advanced CMOS Setup" },

  -- Save and Exit
  { 10, 5,  "F10", "Save and Exit" },
  { 10, 5,  "Y", "" },
  { 10, 10, "ENTER", "" },
}