-- ./mame -w ct486 -nvram_directory /dev/null win2k -flop1 wndws98b -hard1 harddisk/win2kps4.chd -skip_gameinfo -ramsize 64M -board3:ide:ide:1 cdrom -cdrom1 win2k -plugins -plugin act486auto
software = "win2k"
chd = "import_dev_hdd_1G"

t_software = {
    { 100, 5, "import_ct486", "Import machine" },
    { 100, 10, "attach_flop1_flop1", "start install" },
    { 7200, 10, "attach_flop1_flop2", "" },
    { 100, 5, "KEY_ENTER", "Disk2" },
    { 15800, 10, "attach_flop1_flop3", "" },
    { 100, 5, "KEY_ENTER", "Disk3" },
    { 11800, 10, "attach_flop1_flop4", "" },
    { 100, 5, "KEY_ENTER", "Disk4" },
    { 13000, 10,"KEY_ENTER", "Start Install" },
    { 300, 5, "KEY_F8", "Agree to terms" },
    { 100, 5, "KEY_ENTER", "Format Disk" },
    { 100, 5, "KEY_ENTER", "NTFS" },
    { 170000, 10,"KEY_ENTER", "" },
    -- { 17000, 10,"attach_flop1_flop5", "" },
    -- { 100, 5, "KEY_ENTER", "Disk5" },
    -- { 17000, 10, "attach_flop1_flop6", "" },
    -- { 100, 5, "KEY_ENTER", "Disk6" },
    -- { 17000, 10, "attach_flop1_flop7", "" },
    -- { 100, 5, "KEY_ENTER", "Disk7" },
    -- { 17000, 10, "attach_flop1_flop8", "" },
    -- { 100, 5, "KEY_ENTER", "Disk8" },
    -- { 17000, 10, "attach_flop1_flop9", "" },
    -- { 100, 5, "KEY_ENTER", "Disk9" },
    -- { 202000, 5, "eject_flop1", "Empty floppy drive" },
    -- { 100, 5, "KEY_ENTER", "Reboot" },
    -- { 10000, 5, "KEY_ENTER", "" },
    -- { 100, 5, "KEY_F8", "Install" },
    -- { 100, 5, "KEY_ENTER", "Select Partition" },
    -- { 100, 5, "KEY_ENTER", "Leave it intact" },
    -- -- gui (no mouse)
    -- { 300000, 5, "KEY_ENTER", "Regional" },
    -- { 100, 5, "KEY_M", "UserName" },
    -- { 100, 5, "KEY_A", "" },
    -- { 100, 5, "KEY_M", "" },
    -- { 100, 5, "KEY_E", "" },
    -- { 100, 5, "KEY_TAB", "" },
    -- { 100, 5, "KEY_TAB", "" },
    -- { 100, 5, "KEY_TAB", "" },
    -- -- product key
    -- { 100, 5, "KEY_ENTER", "" },
    -- { 100, 5, "KEY_TAB", "" },
    -- { 100, 5, "KEY_M", "Password" },
    -- { 100, 5, "KEY_A", "" },
    -- { 100, 5, "KEY_M", "" },
    -- { 100, 5, "KEY_E", "" },
    -- { 100, 5, "KEY_TAB", "" },
    -- { 100, 5, "KEY_M", "" },
    -- { 100, 5, "KEY_A", "" },
    -- { 100, 5, "KEY_M", "" },
    -- { 100, 5, "KEY_E", "" },
    -- { 100, 5, "KEY_ENTER", "" },
    -- { 100, 5, "KEY_ENTER", "Timezone" },
    -- { 100, 5, "KEY_ENTER", "ALWAYS" },
}
