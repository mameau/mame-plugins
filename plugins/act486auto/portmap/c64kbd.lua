-- for port in pairs(manager.machine.ioport.ports)
-- do
--   for key in pairs(manager.machine.ioport.ports[port].fields)
--   do  
--     print('[""] = { "' .. port .. '", "' .. key ..'" },')
--   end 
-- end

portmap = {
    ["KEY_SHIFT_LOCK"] = { ":LOCK", "SHIFT LOCK" },
    ["KEY_RESTORE"] = { ":RESTORE", "RESTORE" },
    ["KEY_DOWN"] = { ":ROW0", "Crsr Down Up" },
    ["KEY_ENTER"] = { ":ROW0", "Return" },
    ["KEY_F3"] = { ":ROW0", "F3" },
    ["KEY_F5"] = { ":ROW0", "F5" },
    ["KEY_F7"] = { ":ROW0", "F7" },
    ["KEY_LEFT"] = { ":ROW0", "Crsr Right Left" },
    ["KEY_DEL"] = { ":ROW0", "INST DEL" },
    ["KEY_F1"] = { ":ROW0", "F1" },
  --  ["KEY_"] = { ":ROW0", "Keyboard" },
    ["KEY_W"] = { ":ROW1", "W" },
    ["KEY_Z"] = { ":ROW1", "Z" },
    ["KEY_A"] = { ":ROW1", "A" },
    ["KEY_4"] = { ":ROW1", "4  $" },
  --  ["KEY_"] = { ":ROW1", "Keyboard" },
    ["KEY_E"] = { ":ROW1", "E" },
    ["KEY_LSHIFT"] = { ":ROW1", "Shift (Left)" },
    ["KEY_S"] = { ":ROW1", "S" },
    ["KEY_3"] = { ":ROW1", "3  #" },
    ["KEY_X"] = { ":ROW2", "X" },
    ["KEY_6"] = { ":ROW2", "6  &" },
    ["KEY_F"] = { ":ROW2", "F" },
  --  ["KEY_"] = { ":ROW2", "Keyboard" },
    ["KEY_D"] = { ":ROW2", "D" },
    ["KEY_5"] = { ":ROW2", "5  %" },
    ["KEY_T"] = { ":ROW2", "T" },
    ["KEY_C"] = { ":ROW2", "C" },
    ["KEY_R"] = { ":ROW2", "R" },
    ["KEY_Y"] = { ":ROW3", "Y" },
    ["KEY_H"] = { ":ROW3", "H" },
    ["KEY_G"] = { ":ROW3", "G" },
    ["KEY_V"] = { ":ROW3", "V" },
    ["KEY_7"] = { ":ROW3", "7  '" },
    ["KEY_8"] = { ":ROW3", "8  (" },
    ["KEY_U"] = { ":ROW3", "U" },
  --  ["KEY_"] = { ":ROW3", "Keyboard" },
    ["KEY_B"] = { ":ROW3", "B" },
    ["KEY_I"] = { ":ROW4", "I" },
    ["KEY_9"] = { ":ROW4", "9  )" },
    ["KEY_M"] = { ":ROW4", "M" },
    ["KEY_K"] = { ":ROW4", "K" },
    ["KEY_J"] = { ":ROW4", "J" },
    ["KEY_0"] = { ":ROW4", "0" },
    ["KEY_O"] = { ":ROW4", "O" },
    ["KEY_N"] = { ":ROW4", "N" },
  --  ["KEY_"] = { ":ROW4", "Keyboard" },
    ["KEY_MINUS"] = { ":ROW5", "-" },
    ["KEY_L"] = { ":ROW5", "L" },
    ["KEY_PLUS"] = { ":ROW5", "+" },
    ["KEY_COMMA"] = { ":ROW5", ",  <" },
    ["KEY_FULLSTOP"] = { ":ROW5", ".  >" },
    ["KEY_P"] = { ":ROW5", "P" },
    ["KEY_COLON"] = { ":ROW5", ":  [" },
    ["KEY_@"] = { ":ROW5", "@" },
  --  ["KEY_"] = { ":ROW5", "Keyboard" },
    ["KEY_EQUALS"] = { ":ROW6", "=" },
    ["KEY_ASTERIX"] = { ":ROW6", "*" },
    ["KEY_SLASH"] = { ":ROW6", "/  ?" },
  --  ["KEY_"] = { ":ROW6", "Keyboard" },
    ["KEY_HOME"] = { ":ROW6", "CLR HOME" },
    ["KEY_POUND"] = { ":ROW6", "£" },
    ["KEY_RSHIFT"] = { ":ROW6", "Shift (Right)" },
    ["KEY_COLON"] = { ":ROW6", ";  ]" },
    ["KEY_PI"] = { ":ROW6", "↑  Pi" },
    ["KEY_1"] = { ":ROW7", "1  !" },
    ["KEY_Q"] = { ":ROW7", "Q" },
    ["KEY_RUNSTOP"] = { ":ROW7", "RUN STOP" },
  --  ["KEY_"] = { ":ROW7", "Keyboard" },
    ["KEY_2"] = { ":ROW7", '2  "' },
    ["KEY_CBM"] = { ":ROW7", "CBM" },
    ["KEY_BACKSPACE"] = { ":ROW7", "←" },
    ["KEY_SPACE"] = { ":ROW7", "Space" },
    ["KEY_CTRL"] = { ":ROW7", "Ctrl" },
  --  [""] = { ":iec8:c1541:ADDRESS", "Device Address" },
    ["JOY1_LEFT"] = { ":joy2:joy:JOY", "P1 Left" },
    ["JOY1_DOWN"] = { ":joy2:joy:JOY", "P1 Down" },
    ["JOY1_BUTTON1"] = { ":joy2:joy:JOY", "P1 Button 1" },
    ["JOY1_UP"] = { ":joy2:joy:JOY", "P1 Up" },
    ["JOY1_RIGHT"] = { ":joy2:joy:JOY", "P1 Right" },  
  }