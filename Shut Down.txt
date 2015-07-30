#!/bin/sh
killall transmission-daemon httpd xinetd
sleep 3
umount -rl /mnt /opt
sleep 2
/sbin/poweroff
