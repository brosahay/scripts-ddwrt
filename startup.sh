#!/bin/sh
 sleep 2
 
# load modules
 insmod mbcache
 insmod jbd
 insmod ext3
 
 sleep 2

# mount root
 mount -t ext3 -o noatime,nodiratime /dev/sda1 /opt
 
 sleep 2

# mount external
 mkdir /tmp/mnt
 mount -t ext3 -o noatime,nodiratime /dev/sda2 /tmp/mnt