#!/bin/sh

# adblock hosts
 curl -L "http://winhelp2002.mvps.org/hosts.txt" >> /tmp/hosts
 curl -L "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext&_=207797" >> /tmp/hosts
 
# alliance adblock hosts
 curl -L "https://raw.githubusercontent.com/revosftw/dd_wrt_scripts/master/adblock/streamride.block" >> /tmp/hosts

 stopservice dnsmasq
 sleep 1
 startservice dnsmasq
 echo -e "ad-block actived"