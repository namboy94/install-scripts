#!/bin/bash

# Git
git config --global user.name "Hermann Krumrey"
git config --global user.email "hermann@krumreyh.com"

# Fingerprint
sudo sed -i '2iauth      sufficient pam_fprintd.so' /etc/pam.d/*
fprintd-enroll
fprintd-enroll -f right-middle-finger

# Bookmarks
echo "sftp://hermann@192.168.1.2/mnt/Main/ FreeNAS" >> $HOME/.config/gtk-3.0/bookmarks
