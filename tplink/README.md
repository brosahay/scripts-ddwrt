## DD-WRT or OPENWRT for similar TP-Link Models
* Download the custom firmware: <firmware>-factory.bin (similar to N941v5)
* Open it in a hex editor. Look at offset 0x40-47.
* There should be the following bytes: `08 41 00 08` (if the firmware was for N841v8)
* Modify to: `09 41 00 05`

     `<PRODUCT_ID> <HW_VERSION>`

* Get:

   * [mktplinkfw.c](https://raw.githubusercontent.com/revosftw/dd_wrt_scripts/master/tplink/mktplinkfw.c)..
   * [md5.c](https://raw.githubusercontent.com/revosftw/dd_wrt_scripts/master/tplink/md5.c)..
   * [md5.h](https://raw.githubusercontent.com/revosftw/dd_wrt_scripts/master/tplink/md5.h)..

* Compile the tool: `gcc -Os mktplinkfw.c md5.c -o mktplinkfw`
* Run: `./mktplinkfw -i *-factory.bin`
* Look for the expected MD5Sum1: expected: `e5 67 34 4d 04 99 20 60 f5 76 c6 04 15 81 ab f8`
* Open the hex editor again, go to offset `0x4c`, and copy the MD5 above (it should span from offset `0x4c` to offset `0x5b`).
* Go and upload the resulting file to firmware upgrade (in TP-Link web-interface).
---
## RESTORE:
* Download the original fw from tp-link site. [ONLY FOR UBOOT]

Then do the following:

   * $`mv <fw_version>_up_boot(<version>).bin fw_original.bin`..
   * $`dd if=fw_original.bin of=tplink_restore.bin skip=257 bs=512`..
   * $`scp tplink_restore.bin fw.bin root@192.168.1.1:/tmp`..
   * ssh/telnet to router: #`mtd -r write /tmp/tplink_restore.bin firmware`

TESTED on TP-Link N941v5.

**CREDITS:** DD-WRT and OPENWRT Forums.