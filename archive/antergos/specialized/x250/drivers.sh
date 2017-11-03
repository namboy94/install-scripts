#!/bin/bash

sudo pacman -S git
sudo pacman -S cinnamon --noconfirm
sudo pacman -S xorg-server --noconfirm
sudo pacman -S xorg-server-utils --noconfirm
sudo pacman -S gdm --noconfirm
sudo pacman -S xfce4-terminal --noconfirm
sudo pacman -S xf86-input-synaptics --noconfirm
sudo pacman -S net-tools --noconfirm
sudo pacman -S networkmanager --noconfirm
sudo pacman -S network-manager-applet --noconfirm
sudo pacman -S gnome-keyring --noconfirm
sudo systemctl enable gdm.service
sudo systemctl disable dhcpcd@ens33.service
sudo systemctl disable dhcpcd.service
sudo systemctl enable NetworkManager

sudo pacman -S fprintd --noconfirm
sudo sed -i '2iauth      sufficient pam_fprintd.so' /etc/pam.d/*
fprintd-enroll
fprintd-enroll -f right-middle-finger
