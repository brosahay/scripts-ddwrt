#!/bin/sh

######################################################################
#
#  Copyright (c) 2017 revosftw (https://github.com/revosftw)
#
######################################################################
curl -L "https://raw.githubusercontent.com/revosftw/dd_wrt_scripts/master/optware/optware-install.sh" | tr -d '\r' > /tmp/optware-install.sh
sh /tmp/optware-install.sh; ipkg update; ipkg upgrade
#wget http://home.karneval.cz/10102207/sort -P /opt/bin; chmod +x /opt/bin/sort
echo 'option verbose-wget'>>/opt/etc/ipkg.conf
ipkg install xinetd htop nano samba2 tftp-hpa wget ntfs-3g
killall xinetd smbd nmbd
rm /opt/etc/samba/smb.conf /opt/etc/vsftpd.conf /opt/etc/init.d/S80samba  /opt/etc/xinetd.d/tftp
wget http://home.karneval.cz/10102207/opt.gz -P /opt
tar -xvzf /opt/opt.gz -C /opt
sh /opt/etc/init.d/S10httpd
sh /opt/etc/init.d/S10xinetd
rm /opt/opt.gz
#ln -s /mnt/data /opt/share/www/data