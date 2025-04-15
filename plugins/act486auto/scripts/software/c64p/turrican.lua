software = "turrican"

  -- offset, release delay, portmap, comment
  -- we dont call attach for a cassette

t_software = {
  { 100, 5, "import_c64p", "Import machine" },
  { 10, 5, "KEYCODE_L", "" },
  { 10, 5, "KEYCODE_O", "" },
  { 10, 5, "KEYCODE_A", "" },
  { 10, 5, "KEYCODE_D", "" },
  { 10, 5, "KEYCODE_LSHIFT,KEYCODE_2", "" },
  { 10, 5, "KEYCODE_CLOSEBRACE", "*" },
  { 10, 5, "KEYCODE_LSHIFT,KEYCODE_2", "" },
  { 10, 5, "KEYCODE_ENTER", "" },
  { 10, 5, "cass_play", "" },
  { 3400, 5, "KEYCODE_R", "" },
  { 10, 5, "KEYCODE_U", "" },
  { 10, 5, "KEYCODE_N", "" },
  { 10, 5, "KEYCODE_ENTER", "" },
  { 60000, 5, "throttle", "" },
}
