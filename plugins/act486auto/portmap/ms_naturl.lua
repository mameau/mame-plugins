-- https://github.com/mamedev/mame/blob/master/src/devices/bus/pc_kbd/msnat.cpp

-- for k, v in pairs(manager.machine.ioport.ports[":kbd:ms_naturl:P1.2"].fields) do print(k) end
portmap = {
    -- P2.0
    ["KEYCODE_Y"] = { ":kbd:ms_naturl:P2.0", "Y" },
    ["KEYCODE_H"] = { ":kbd:ms_naturl:P2.0", "H" },
    ["KEYCODE_J"] = { ":kbd:ms_naturl:P2.0", "J" },
    ["KEYCODE_N"] = { ":kbd:ms_naturl:P2.0", "N" },
    ["KEYCODE_M"] = { ":kbd:ms_naturl:P2.0", "M" },
    ["KEYCODE_U"] = { ":kbd:ms_naturl:P2.0", "U" },
    ["KEYCODE_6"] = { ":kbd:ms_naturl:P2.0", "6" },
    ["KEYCODE_7"] = { ":kbd:ms_naturl:P2.0", "7" },
    -- P2.1
    ["KEYCODE_ENTER"] = { ":kbd:ms_naturl:P2.1", "Enter" },
    ["KEYCODE_BACKSLASH"] = { ":kbd:ms_naturl:P2.1", "\\" },
    ["KEYCODE_CLOSEBRACE"] = { ":kbd:ms_naturl:P2.1", "]" },
    ["KEYCODE_LEFT"] = { ":kbd:ms_naturl:P2.1", "Cursor Left" },
    ["KEYCODE_BACKSPACE"] = { ":kbd:ms_naturl:P2.1", "Backspace" },
    ["KEYCODE_F5"] = { ":kbd:ms_naturl:P2.1", "F5" },
    ["KEYCODE_F6"] = { ":kbd:ms_naturl:P2.1", "F6" },
    ["KEYCODE_EQUALS"] = { ":kbd:ms_naturl:P2.1", "=" },
    -- P2.2
    ["KEYCODE_9"] = { ":kbd:ms_naturl:P2.2", "9" },
    ["KEYCODE_O"] = { ":kbd:ms_naturl:P2.2", "O" },
    ["KEYCODE_OPENBRACE"] = { ":kbd:ms_naturl:P2.2", "[" },
    ["KEYCODE_L"] = { ":kbd:ms_naturl:P2.2", "L" },
    ["KEYCODE_STOP"] = { ":kbd:ms_naturl:P2.2", "." },
    ["KEYCODE_MINUS"] = { ":kbd:ms_naturl:P2.2", "-" },
    ["KEYCODE_F7"] = { ":kbd:ms_naturl:P2.2", "F7" },
    ["KEYCODE_F8"] = { ":kbd:ms_naturl:P2.2", "F8" },
    -- P2.3
    ["KEYCODE_0"] = { ":kbd:ms_naturl:P2.3", "0" },
    ["KEYCODE_COLON"] = { ":kbd:ms_naturl:P2.3", ";" },
    ["KEYCODE_QUOTE"] = { ":kbd:ms_naturl:P2.3", "'" },
    ["KEYCODE_SLASH"] = { ":kbd:ms_naturl:P2.3", "/" },
    ["KEYCODE_DOWN"] = { ":kbd:ms_naturl:P2.3", "Cursor Down" },
    ["KEYCODE_P"] = { ":kbd:ms_naturl:P2.3", "P" },
    ["KEYCODE_F9"] = { ":kbd:ms_naturl:P2.3", "F9" },
    ["KEYCODE_F10"] = { ":kbd:ms_naturl:P2.3", "F10" },
    -- P2.4
    ["KEYCODE_UP"] = { ":kbd:ms_naturl:P2.4", "Cursor Up" },
    ["KEYCODE_RWIN"] = { ":kbd:ms_naturl:P2.4", "Right Win" },
    ["KEYCODE_RIGHT"] = { ":kbd:ms_naturl:P2.4", "Cursor Right" },
    ["KEYCODE_SPACE"] = { ":kbd:ms_naturl:P2.4", "Space" },
    -- P2.5
    ["KEYCODE_HOME"] = { ":kbd:ms_naturl:P2.5", "Home" },
    ["KEYCODE_8_PAD"] = { ":kbd:ms_naturl:P2.5", "Keypad 8" },
    ["KEYCODE_5_PAD"] = { ":kbd:ms_naturl:P2.5", "Keypad 5" },
    ["KEYCODE_2_PAD"] = { ":kbd:ms_naturl:P2.5", "Keypad 2" },
    ["KEYCODE_0_PAD"] = { ":kbd:ms_naturl:P2.5", "Keypad 0" },
    ["KEYCODE_END"] = { ":kbd:ms_naturl:P2.5", "End" },
    ["KEYCODE_F11"] = { ":kbd:ms_naturl:P2.5", "F11" },
    ["KEYCODE_F12"] = { ":kbd:ms_naturl:P2.5", "F12" },
    -- P2.6
    ["KEYCODE_INSERT"] = { ":kbd:ms_naturl:P2.6", "Insert" },
    ["KEYCODE_DEL"] = { ":kbd:ms_naturl:P2.6", "Delete" },
    ["KEYCODE_6_PAD"] = { ":kbd:ms_naturl:P2.6", "Keypad 6" },
    ["KEYCODE_3_PAD"] = { ":kbd:ms_naturl:P2.6", "Keypad 3" },
    --["??"] = { ":kbd:ms_naturl:P2.6", "Keypad ." },
    ["KEYCODE_9_PAD"] = { ":kbd:ms_naturl:P2.6", "Keypad 9" },
    ["KEYCODE_F3"] = { ":kbd:ms_naturl:P2.6", "F3" },
    ["KEYCODE_F4"] = { ":kbd:ms_naturl:P2.6", "F4" },
    -- P2.7
    ["KEYCODE_SLASH"] = { ":kbd:ms_naturl:P2.7", "Keypad /" },
    ["KEYCODE_7_PAD"] = { ":kbd:ms_naturl:P2.7", "Keypad 7" },
    ["KEYCODE_4_PAD"] = { ":kbd:ms_naturl:P2.7", "Keypad 4" },
    ["KEYCODE_PLUS_PAD"] = { ":kbd:ms_naturl:P2.7", "Keypad +" },
    ["KEYCODE_1_PAD"] = { ":kbd:ms_naturl:P2.7", "Keypad 1" },
    ["KEYCODE_ASTERIX"] = { ":kbd:ms_naturl:P2.7", "Keypad *" },
    ["KEYCODE_PRTSCR"] = { ":kbd:ms_naturl:P2.7", "Print Screen" },
    ["KEYCODE_MENU"] = { ":kbd:ms_naturl:P2.7", "Menu" },
    -- P1.0
    ["KEYCODE_LWIN"] = { ":kbd:ms_naturl:P1.0", "Left Win" },
    ["KEYCODE_SCRLOCK"] = { ":kbd:ms_naturl:P1.0", "Scroll Lock" },
    ["KEYCODE_ENTER_PAD"] = { ":kbd:ms_naturl:P1.0", "Keypad Enter" },
    -- P1.1
    ["KEYCODE_LCTRL"] = { ":kbd:ms_naturl:P1.1", "Left Ctrl" },
    ["KEYCODE_RCTRL"] = { ":kbd:ms_naturl:P1.1", "Right Ctrl" },
    ["KEYCODE_CAPS"] = { ":kbd:ms_naturl:P1.1", "Caps Lock" },
    -- P1.2
    ["KEYCODE_PGUP"] = { ":kbd:ms_naturl:P1.2", "Page Up" },
    ["KEYCODE_2"] = { ":kbd:ms_naturl:P1.2", "2" },
    ["KEYCODE_W"] = { ":kbd:ms_naturl:P1.2", "W" },
    ["KEYCODE_S"] = { ":kbd:ms_naturl:P1.2", "S" },
    ["KEYCODE_X"] = { ":kbd:ms_naturl:P1.2", "X" },
    ["KEYCODE_PGDN"] = { ":kbd:ms_naturl:P1.2", "Page Down" },
    ["KEYCODE_F1"] = { ":kbd:ms_naturl:P1.2", "F1" },
    ["KEYCODE_F2"] = { ":kbd:ms_naturl:P1.2", "F2" },
    -- P1.3
    ["KEYCODE_LALT"] = { ":kbd:ms_naturl:P1.3", "Left Alt" },
    ["KEYCODE_RALT"] = { ":kbd:ms_naturl:P1.3", "Right Alt" },
    ["KEYCODE_MINUS_PAD"] = { ":kbd:ms_naturl:P1.3", "Keypad -" },
    ["KEYCODE_NUMLOCK"] = { ":kbd:ms_naturl:P1.3", "Num Lock" },
    -- P1.4
    ["KEYCODE_I"] = { ":kbd:ms_naturl:P1.4", "I" },
    ["KEYCODE_K"] = { ":kbd:ms_naturl:P1.4", "K" },
    ["KEYCODE_D"] = { ":kbd:ms_naturl:P1.4", "D" },
    ["KEYCODE_C"] = { ":kbd:ms_naturl:P1.4", "C" },
    ["KEYCODE_COMMA"] = { ":kbd:ms_naturl:P1.4", "," },
    ["KEYCODE_E"] = { ":kbd:ms_naturl:P1.4", "E" },
    ["KEYCODE_3"] = { ":kbd:ms_naturl:P1.4", "3" },
    ["KEYCODE_8"] = { ":kbd:ms_naturl:P1.4", "8" },
    -- P1.5
    ["KEYCODE_5"] = { ":kbd:ms_naturl:P1.5", "5" },
    ["KEYCODE_R"] = { ":kbd:ms_naturl:P1.5", "R" },
    ["KEYCODE_F"] = { ":kbd:ms_naturl:P1.5", "F" },
    ["KEYCODE_G"] = { ":kbd:ms_naturl:P1.5", "G" },
    ["KEYCODE_V"] = { ":kbd:ms_naturl:P1.5", "V" },
    ["KEYCODE_B"] = { ":kbd:ms_naturl:P1.5", "B" },
    ["KEYCODE_T"] = { ":kbd:ms_naturl:P1.5", "T" },
    ["KEYCODE_4"] = { ":kbd:ms_naturl:P1.5", "4" },
    -- P1.6
    ["KEYCODE_ESC"] = { ":kbd:ms_naturl:P1.6", "Esc" },
    ["KEYCODE_1"] = { ":kbd:ms_naturl:P1.6", "1" },
    ["KEYCODE_Q"] = { ":kbd:ms_naturl:P1.6", "Q" },
    ["KEYCODE_A"] = { ":kbd:ms_naturl:P1.6", "A" },
    ["KEYCODE_Z"] = { ":kbd:ms_naturl:P1.6", "Z" },
    ["KEYCODE_TAB"] = { ":kbd:ms_naturl:P1.6", "Tab" },
    ["KEYCODE_TILDE"] = { ":kbd:ms_naturl:P1.6", "`" },
    -- P1.7
    ["KEYCODE_LSHIFT"] = { ":kbd:ms_naturl:P1.7", "Left Shift" },
    ["KEYCODE_RSHIFT"] = { ":kbd:ms_naturl:P1.7", "Right Shift" },
    ["KEYCODE_CANCEL"] = { ":kbd:ms_naturl:P1.7", "Break" },
  }
