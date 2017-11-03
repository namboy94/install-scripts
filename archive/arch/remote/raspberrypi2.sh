#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

if [ $# -eq 1 ]
  then
    echo "Not enough arguments"
    exit 1
fi

if [ "$1" == "rooter" ]
    then
        echo "installing"
        hostname=$2
        su root -c "bash /home/alarm/installer.sh install "$hostname""
        su hermann
fi

if [ "$1" == "install" ]
    then
        useradd -m -G wheel -s /bin/bash hermann
        mkdir -p /home/hermann/.ssh
        chown -R hermann /home/hermann
        mv /home/alarm/.ssh/id_rsa /home/hermann/.ssh/id_rsa
        mv /home/alarm/.ssh/id_rsa.pub /home/hermann/.ssh/id_rsa.pub
        userdel -fr alarm
        passwd
        passwd hermann
        pacman -Syu --noconfirm
        pacman -S sudo --noconfirm
        echo "hermann ALL=(ALL) ALL" >> /etc/sudoers
        hostnamectl set-hostname "$2"
        cd /home/hermann
        pacman -S git --noconfirm
        cd /home/hermann
        git clone ssh://192.168.1.2/mnt/Main/Programming/Git%20Repositories/Bash/install-scripts
        su hermann -c "bash /home/hermann/install-scripts/arch/sequential/raspberrypi2.sh"
        exit 0
fi

if [ $# -eq 2 ]
  then
    echo "Not enough arguments"
    exit 1
fi

address=$1
keyfile=$2
hostname=$3
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#echo "pwd = alarm"
echo "ssh alarm@"$address" \"mkdir /home/alarm/.ssh\""
ssh alarm@"$address" "mkdir /home/alarm/.ssh"
scp "$DIR"/raspberrypi2.sh alarm@"$address":/home/alarm/installer.sh
scp "$keyfile" alarm@"$address":/home/alarm/.ssh/id_rsa
scp "$keyfile".pub alarm@"$address":/home/alarm/.ssh/id_rsa.pub
ssh alarm@"$address" "chmod 755 /home/alarm/installer.sh"
ssh alarm@"$address" "bash /home/alarm/installer.sh rooter "$hostname""