#!/bin/bash

if [ ! -f $HOME/.ssh/id_rsa ]; then
    echo "SSH Key not found. Please provide an SSH key in .ssh"
    exit
fi

#Force Sudo
sudo ls >> /dev/null

#Install Essential Programs
sudo pacman -S rsync --noconfirm
sudo pacman -S sshfs --noconfirm
sudo pacman -S svn --noconfirm
sudo pacman -S jdk8-openjdk --noconfirm
sudo pacman -S python-pip --noconfirm
sudo pacman -S python2-pip --noconfirm
sudo pacman -S pygtk --noconfirm
sudo pacman -S gksu --noconfirm
sudo pacman -S gparted --noconfirm
sudo pacman -S tigervnc --noconfirm
sudo pacman -S python-gobject

#Remove unnecessary Programs
sudo pacman -Rcns pamac

#Add Bookmarks
echo "sftp://www.krumreyh.de@ssh.strato.de/ Strato" >> $HOME/.config/gtk-3.0/bookmarks
echo "sftp://hermann@krumreyh.asuscomm.com:9022/mnt/Main FreeNAS" >> $HOME/.config/gtk-3.0/bookmarks

#Edit bashrc
mkdir $HOME/.bin
echo "PATH=\$PATH:\$HOME/.bin" >> $HOME/.bashrc
echo "alias brew=\"sudo pacman -S\"" >> $HOME/.bashrc
echo "alias update=\"sudo pacman -Syu\"" >> $HOME/.bashrc

#Update Grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

#mount-temp
mkdir $HOME/Temp
echo '#!/bin/bash' >> $HOME/.bin/mount-temp
echo "sshfs -o idmap=user hermann@krumreyh.asuscomm.com:/mnt/Main/Temp/ \$HOME/Temp/ -p 9022" >> $HOME/.bin/mount-temp
sudo chmod 755 $HOME/.bin/mount-temp
