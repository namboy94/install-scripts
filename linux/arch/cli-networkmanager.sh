#!/bin/bash
# run as root

pacman -S networkmanager dhclient
systemctl restart NetworkManager.service
systemctl enable NetworkManager.service
echo 'nmcli dev wifi connect "SSID" password "PASSWORD"'

echo '
# http://www.szakmeister.net/blog/2017/jun/1/static-ip-nmcli/
# To change the IP address to a manual one do this:
nmcli con edit CONNECTION
set ipv4.addresses IP_ADDRESS/24
# Set to manual
save
quit
'