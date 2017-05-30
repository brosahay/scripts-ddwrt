#!/bin/sh

 echo "nobody:*:65000:65000:nobody:/mnt:/bin/false" >> /etc/passwd

# fix harddisk spindown issues
 echo 1 > /sys/class/scsi_disk/0:0:0:0/allow_restart
#echo 1 > /sys/block/sda/device/scsi_disk/0:0:0:0/allow_restart

# firewall port forward
 iptables -I INPUT -p tcp -d 192.168.1.1 --dport 50000 -j logaccept
 
 sleep 5
 
# start transmission torrent client 
 transmission-daemon -g /mnt/data/torrents/.config/transmission-daemon

#insmod /lib/modules/3.2.48-svn22050/kernel/fs/fuse/fuse.ko
#ntfs-3g /dev/sda3 /mnt