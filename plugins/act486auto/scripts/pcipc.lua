start = 900
keymap = "at_keyboard"

tags = {}

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

