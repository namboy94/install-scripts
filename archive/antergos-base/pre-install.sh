#!/bin/bash

mkdir $HOME/.ssh
sudo pacman -S udisks2

lsblk
echo "Enter device name (including /dev)"
read device
udisksctl unlock -b $device

echo "Enter unlocked device name (Including /dev)"
read unlockeddevice
udisksctl mount -b $unlockeddevice

echo "Enter mounted directory path"
read mounteddir

cp $mounteddir/RSA/X250/* $HOME/.ssh
