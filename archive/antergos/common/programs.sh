#!/bin/bash

###BASIC###
sudo pacman -S nautilus --noconfirm


###JETBRAINS IDEs###
mkdir $HOME/IDEs
mkdir $HOME/IDEs/projects
mkdir $HOME/IDEs/projects/intellij
mkdir $HOME/IDEs/projects/pycharm
mkdir $HOME/IDEs/projects/webstorm
mkdir $HOME/IDEs/projects/clion

git clone https://aur.archlinux.org/intellij-idea-ultimate-edition.git
cd intellij-idea-ultimate-edition
makepkg -sri --noconfirm
cd ..
rm -rf intellij-idea-ultimate-edition

git clone https://aur.archlinux.org/clion.git
cd clion
makepkg -sri --noconfirm
cd ..
rm -rf clion

git clone https://aur.archlinux.org/webstorm.git
cd webstorm
makepkg -sri --noconfirm
cd ..
rm -rf webstorm

git clone https://aur.archlinux.org/pycharm-professional.git
cd pycharm-professional
makepkg -sri --noconfirm
cd ..
rm -rf pycharm-professional

git clone https://aur.archlinux.org/android-studio.git
cd android-studio
makepkg -sri --noconfirm
cd ..
rm -rf android-studio



###MEDIA###
#hexchat
sudo pacman -S hexchat --noconfirm

#irssi
sudo pacman -S irssi --noconfirm

#vlc
sudo pacman -S vlc --noconfirm

#Trackma
sudo pip2 install trackma


###COMMUNICATION###
#skype
sudo pacman -S skype --noconfirm

#thunderbird
sudo pacman -S thunderbird --noconfirm


###INTERNET###
#Owncloud
sudo pacman -S owncloud-client --noconfirm

#chromium
sudo pacman -S chromium --noconfirm

###GAMES###
#steam
sudo pacman -S steam --noconfirm #Manual Config

#playonlinux
sudo pacman -S playonlinux --noconfirm #Manual Config
