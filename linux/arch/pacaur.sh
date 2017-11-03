#!/bin/bash

sudo pacman -Syy
sudo pacman -S git
git clone https://aur.archlinux.org/pacaur.git
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
cd pacaur
makepkg -si
cd ..