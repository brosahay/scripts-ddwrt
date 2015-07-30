#!/bin/sh
wget -q -O /mnt/etc/hosts.txt http://winhelp2002.mvps.org/hosts.txt
sleep 2
cat /mnt/etc/hosts.txt | grep 127.0.0.1 >> /tmp/hosts
cat /mnt/etc/ADBLOCK.txt | grep 127.0.0.1 >> /tmp/hosts
stopservice dnsmasq
sleep 1
startservice dnsmasq
echo "Hosts UPDATED"
