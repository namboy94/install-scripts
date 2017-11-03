#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

device=$1

echo "Data on $device will be irrevocably destroyed"

echo "Enter the following: o; p; n; p; 1; ENTER; +100M; t; c; n; p; 2; ENTER; ENTER; w"
sudo fdisk $device

sudo mkfs.vfat "$device"1
sudo mkdir boot
sudo mount "$device"1 boot

sudo mkfs.ext4 "$device"2
sudo mkdir root
sudo mount "$device"2 root

sudo wget http://archlinuxarm.org/os/ArchLinuxARM-rpi-2-latest.tar.gz
sudo bsdtar -xpf ArchLinuxARM-rpi-2-latest.tar.gz -C root
sudo sync

sudo mv root/boot/* boot

sudo umount boot root

#cleanup
sudo rm ArchLinuxARM-rpi-2-latest.tar.gz
sudo rmdir root boot

echo "Done"