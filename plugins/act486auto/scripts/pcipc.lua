start = 800
keymap = "at_keyboard"

tags = {
  screen1 = ":pci:4:virge:screen",
  flop1 = ":board4:fdc37c93x:fdc:0:35hd",
  flop2 = ":board4:fdc37c93x:fdc:1:35hd",
  hard1 = ":pci:07.1:ide1:0:hdd:image",
  cdrom1 = ":pci:07.1:ide2:0:cdrom:image",
}

t_step = {
  -- offset, release delay, portmap, comment
  -- Enter Bios
  { 100, 10, "KEYCODE_F2", "Enter Bios" },
  -- Floppies
  { 10, 5, "KEYCODE_DOWN", "Configure Floppy Drives" },
  { 10, 5, "KEYCODE_DOWN", "" },
  { 10, 5, "KEYCODE_DOWN", "" },
  ---- Drive B
  { 20, 10, "KEYCODE_ENTER", "Drive B" },
  { 10, 5, "KEYCODE_DOWN", "" },
  { 10, 5, "KEYCODE_DOWN", "" },
  { 10, 5, "KEYCODE_DOWN", "" },
  { 10, 5, "KEYCODE_DOWN", "" },
  { 20, 10, "KEYCODE_ENTER", "" },

--  -- Advanced CMOS Setup
--  { 10, 5,  "KEYCODE_RIGHT", "" },
--  { 10, 5,  "KEYCODE_RIGHT", "" },
--  { 10, 5,  "KEYCODE_RIGHT", "" },
--  { 10, 5,  "KEYCODE_RIGHT", "" },
--  { 10, 5,  "KEYCODE_RIGHT", "" },
--  { 20, 10, "KEYCODE_ENTER", "" },
--  { 20, 10, "KEYCODE_ENTER", "" },

  -- Save and Exit
  { 10, 5,  "KEYCODE_F10", "Save and Exit" },
  { 10, 5,  "KEYCODE_Y", "" },
  { 10, 10, "KEYCODE_ENTER", "" },
}

