#!/bin/bash

sudo pacman -Syy
sudo pacman -S gdm cinnamon gnome-keyring networkmanager xfce4-terminal
sudo systemctl enable gdm.service
sudo systemctl enable NetworkManager.service

echo "After this, configure the following:"
echo "System preferences, especially for terminal"
echo "Reboot now or start gdm.service"