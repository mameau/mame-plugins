-- https://github.com/mamedev/mame/blob/master/src/devices/bus/pc_kbd/msnat.cpp

-- for k, v in pairs(manager.machine.ioport.ports[":kbd:ms_naturl:P1.2"].fields) do print(k) end
portmap = {
    -- P2.0
    ["KEY_Y"] = { ":kbd:ms_naturl:P2.0", "Y" },
    ["KEY_H"] = { ":kbd:ms_naturl:P2.0", "H" },
    ["KEY_J"] = { ":kbd:ms_naturl:P2.0", "J" },
    ["KEY_N"] = { ":kbd:ms_naturl:P2.0", "N" },
    ["KEY_M"] = { ":kbd:ms_naturl:P2.0", "M" },
    ["KEY_U"] = { ":kbd:ms_naturl:P2.0", "U" },
    ["KEY_6"] = { ":kbd:ms_naturl:P2.0", "6" },
    ["KEY_7"] = { ":kbd:ms_naturl:P2.0", "7" },
    -- P2.1
    ["KEY_ENTER"] = { ":kbd:ms_naturl:P2.1", "Enter" },
    ["KEY_BACKSLASH"] = { ":kbd:ms_naturl:P2.1", "\\" },
    ["KEY_CLOSEBRACE"] = { ":kbd:ms_naturl:P2.1", "]" },
    ["KEY_LEFT"] = { ":kbd:ms_naturl:P2.1", "Cursor Left" },
    ["KEY_BACKSPACE"] = { ":kbd:ms_naturl:P2.1", "Backspace" },
    ["KEY_F5"] = { ":kbd:ms_naturl:P2.1", "F5" },
    ["KEY_F6"] = { ":kbd:ms_naturl:P2.1", "F6" },
    ["KEY_EQUALS"] = { ":kbd:ms_naturl:P2.1", "=" },
    -- P2.2
    ["KEY_9"] = { ":kbd:ms_naturl:P2.2", "9" },
    ["KEY_0"] = { ":kbd:ms_naturl:P2.2", "0" },
    ["KEY_OPENBRACE"] = { ":kbd:ms_naturl:P2.2", "[" },
    ["KEY_L"] = { ":kbd:ms_naturl:P2.2", "L" },
    ["KEY_STOP"] = { ":kbd:ms_naturl:P2.2", "." },
    ["KEY_MINUS"] = { ":kbd:ms_naturl:P2.2", "-" },
    ["KEY_F7"] = { ":kbd:ms_naturl:P2.2", "F7" },
    ["KEY_F8"] = { ":kbd:ms_naturl:P2.2", "F8" },
    -- P2.3
    ["KEY_0"] = { ":kbd:ms_naturl:P2.3", "0" },
    ["KEY_COLON"] = { ":kbd:ms_naturl:P2.3", ";" },
    ["KEY_QUOTE"] = { ":kbd:ms_naturl:P2.3", "'" },
    ["KEY_SLASH"] = { ":kbd:ms_naturl:P2.3", "/" },
    ["KEY_DOWN"] = { ":kbd:ms_naturl:P2.3", "Cursor Down" },
    ["KEY_P"] = { ":kbd:ms_naturl:P2.3", "P" },
    ["KEY_F9"] = { ":kbd:ms_naturl:P2.3", "F9" },
    ["KEY_F10"] = { ":kbd:ms_naturl:P2.3", "F10" },
    -- P2.4
    ["KEY_UP"] = { ":kbd:ms_naturl:P2.4", "Cursor Up" },
    ["KEY_RWIN"] = { ":kbd:ms_naturl:P2.4", "Right Win" },
    ["KEY_RIGHT"] = { ":kbd:ms_naturl:P2.4", "Cursor Right" },
    ["KEY_SPACE"] = { ":kbd:ms_naturl:P2.4", "Space" },
    -- P2.5
    ["KEY_HOME"] = { ":kbd:ms_naturl:P2.5", "Home" },
    ["KEY_8_PAD"] = { ":kbd:ms_naturl:P2.5", "Keypad 8" },
    ["KEY_5_PAD"] = { ":kbd:ms_naturl:P2.5", "Keypad 5" },
    ["KEY_2_PAD"] = { ":kbd:ms_naturl:P2.5", "Keypad 2" },
    ["KEY_0_PAD"] = { ":kbd:ms_naturl:P2.5", "Keypad 0" },
    ["KEY_END"] = { ":kbd:ms_naturl:P2.5", "End" },
    ["KEY_F11"] = { ":kbd:ms_naturl:P2.5", "F11" },
    ["KEY_F12"] = { ":kbd:ms_naturl:P2.5", "F12" },
    -- P2.6
    ["KEY_INSERT"] = { ":kbd:ms_naturl:P2.6", "Insert" },
    ["KEY_DEL"] = { ":kbd:ms_naturl:P2.6", "Delete" },
    ["KEY_6_PAD"] = { ":kbd:ms_naturl:P2.6", "Keypad 6" },
    ["KEY_3_PAD"] = { ":kbd:ms_naturl:P2.6", "Keypad 3" },
    --["??"] = { ":kbd:ms_naturl:P2.6", "Keypad ." },
    ["KEY_9_PAD"] = { ":kbd:ms_naturl:P2.6", "Keypad 9" },
    ["KEY_F3"] = { ":kbd:ms_naturl:P2.6", "F3" },
    ["KEY_F4"] = { ":kbd:ms_naturl:P2.6", "F4" },
    -- P2.7
    ["KEY_SLASH"] = { ":kbd:ms_naturl:P2.7", "Keypad /" },
    ["KEY_7_PAD"] = { ":kbd:ms_naturl:P2.7", "Keypad 7" },
    ["KEY_4_PAD"] = { ":kbd:ms_naturl:P2.7", "Keypad 4" },
    ["KEY_PLUS_PAD"] = { ":kbd:ms_naturl:P2.7", "Keypad +" },
    ["KEY_1_PAD"] = { ":kbd:ms_naturl:P2.7", "Keypad 1" },
    ["KEY_ASTERIX"] = { ":kbd:ms_naturl:P2.7", "Keypad *" },
    ["KEY_PRTSCR"] = { ":kbd:ms_naturl:P2.7", "Print Screen" },
    ["KEY_MENU"] = { ":kbd:ms_naturl:P2.7", "Menu" },
    -- P1.0
    ["KEY_LWIN"] = { ":kbd:ms_naturl:P1.0", "Left Win" },
    ["KEY_SCRLOCK"] = { ":kbd:ms_naturl:P1.0", "Scroll Lock" },
    ["KEY_ENTER_PAD"] = { ":kbd:ms_naturl:P1.0", "Keypad Enter" },
    -- P1.1
    ["LCONTROL"] = { ":kbd:ms_naturl:P1.1", "Left Ctrl" },
    ["RCONTROL"] = { ":kbd:ms_naturl:P1.1", "Right Ctrl" },
    ["CAPSLOCK"] = { ":kbd:ms_naturl:P1.1", "Caps Lock" },
    -- P1.2
    ["KEY_PGUP"] = { ":kbd:ms_naturl:P1.2", "Page Up" },
    ["KEY_2"] = { ":kbd:ms_naturl:P1.2", "2" },
    ["KEY_W"] = { ":kbd:ms_naturl:P1.2", "W" },
    ["KEY_S"] = { ":kbd:ms_naturl:P1.2", "S" },
    ["KEY_X"] = { ":kbd:ms_naturl:P1.2", "X" },
    ["KEY_PGDOWN"] = { ":kbd:ms_naturl:P1.2", "Page Down" },
    ["KEY_F1"] = { ":kbd:ms_naturl:P1.2", "F1" },
    ["KEY_F2"] = { ":kbd:ms_naturl:P1.2", "F2" },
    -- P1.3
    ["KEY_LALT"] = { ":kbd:ms_naturl:P1.3", "Left Alt" },
    ["KEY_RALT"] = { ":kbd:ms_naturl:P1.3", "Right Alt" },
    ["KEY_MINUS_PAD"] = { ":kbd:ms_naturl:P1.3", "Keypad -" },
    ["KEY_NUMLOCK"] = { ":kbd:ms_naturl:P1.3", "Num Lock" },
    -- P1.4
    ["KEY_I"] = { ":kbd:ms_naturl:P1.4", "I" },
    ["KEY_K"] = { ":kbd:ms_naturl:P1.4", "K" },
    ["KEY_D"] = { ":kbd:ms_naturl:P1.4", "D" },
    ["KEY_C"] = { ":kbd:ms_naturl:P1.4", "C" },
    ["KEY_COMMA"] = { ":kbd:ms_naturl:P1.4", "," },
    ["KEY_E"] = { ":kbd:ms_naturl:P1.4", "E" },
    ["KEY_3"] = { ":kbd:ms_naturl:P1.4", "3" },
    ["KEY_8"] = { ":kbd:ms_naturl:P1.4", "8" },
    -- P1.5
    ["KEY_5"] = { ":kbd:ms_naturl:P1.5", "5" },
    ["KEY_R"] = { ":kbd:ms_naturl:P1.5", "R" },
    ["KEY_F"] = { ":kbd:ms_naturl:P1.5", "F" },
    ["KEY_G"] = { ":kbd:ms_naturl:P1.5", "G" },
    ["KEY_V"] = { ":kbd:ms_naturl:P1.5", "V" },
    ["KEY_B"] = { ":kbd:ms_naturl:P1.5", "B" },
    ["KEY_T"] = { ":kbd:ms_naturl:P1.5", "T" },
    ["KEY_4"] = { ":kbd:ms_naturl:P1.5", "4" },
    -- P1.6
    ["KEY_ESC"] = { ":kbd:ms_naturl:P1.6", "Esc" },
    ["KEY_1"] = { ":kbd:ms_naturl:P1.6", "1" },
    ["KEY_Q"] = { ":kbd:ms_naturl:P1.6", "Q" },
    ["KEY_A"] = { ":kbd:ms_naturl:P1.6", "A" },
    ["KEY_Z"] = { ":kbd:ms_naturl:P1.6", "Z" },
    ["KEY_TAB"] = { ":kbd:ms_naturl:P1.6", "Tab" },
    ["KEY_TILDE"] = { ":kbd:ms_naturl:P1.6", "`" },
    -- P1.7
    ["KEY_LSHIFT"] = { ":kbd:ms_naturl:P1.7", "Left Shift" },
    ["KEY_RSHIFT"] = { ":kbd:ms_naturl:P1.7", "Right Shift" },
    ["KEY_CANCEL"] = { ":kbd:ms_naturl:P1.7", "Break" },
  }