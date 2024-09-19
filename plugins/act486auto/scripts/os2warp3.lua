-- this currently crashes during install, needs more work

software = "os2warp3"

  -- offset, release delay, portmap, comment
t_software = {
  { 10, 10, "fd0_flop1", "Insert Installation Disk" },
  { 2000, 10, "cd0_cdrom1", "Insert CDROM ATAPI" },
  { 1500, 10, "fd0_flop2", "Insert Diskette 1" },
  { 10, 10, "ENTER", "" },
  { 10000, 10, "ENTER", "" },
}

-- board3:ide:ide:0 cdrom            ATAPI CD-ROM
--                  cf               ATA CompactFlash Card
--                  cp2024           Conner Peripherals CP-2024 hard disk
--                  cr589            Matsushita CR589 CD-ROM Drive
--                  hdd              IDE Hard Disk
--                  px320a           PleXCombo PX-320A CD-RW/DVD-ROM Drive
--                  xm3301           Toshiba XM-3301 CD-ROM Drive
--                  zip100           Iomega Zip 100MB IDE Drive
