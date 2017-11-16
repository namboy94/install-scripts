#!/bin/bash
# Copyright 2017 Hermann Krumrey <hermann@krumreyh.com>
#
# This file is part of install-scripts.
#
# install-scripts is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# install-scripts is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with install-scripts.  If not, see <http://www.gnu.org/licenses/>.

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