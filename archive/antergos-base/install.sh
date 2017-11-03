#!/bin/bash

if [ ! -f $HOME/.ssh/id_rsa ]; then
    echo "SSH private Key not found. Please provide an SSH private key in .ssh"
    exit
fi
if [ ! -f $HOME/.ssh/id_rsa.pub ]; then
    echo "SSH public Key not found. Please provide an SSH public key in .ssh"
    exit
fi

# Permission setup
chmod g-w,o-w ~
touch $HOME/.ssh/authorized_keys
touch $HOME/.ssh/known_hosts
chown $USER $HOME/.ssh
chown $USER $HOME/.ssh/*
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/id_rsa
chmod 644 $HOME/.ssh/id_rsa.pub
chmod 644 $HOME/.ssh/authorized_keys
chmod 644 $HOME/.ssh/known_hosts

# Install (Pacman)
# Dev
sudo pacman -S git --noconfirm
sudo pacman -S svn --noconfirm
sudo pacman -S jdk8-openjdk --noconfirm
sudo pacman -S python-pip --noconfirm
sudo pacman -S python2-pip --noconfirm
sudo pacman -S python-gobject --noconfirm
sudo pacman -S pygtk --noconfirm
sudo pacman -S gedit --noconfirm

# Drivers & Essentials
sudo pacman -S xorg-server --noconfirm
sudo pacman -S xorg-server-utils --noconfirm
sudo pacman -S cinnamon --noconfirm
sudo pacman -S gdm --noconfirm
sudo pacman -S xfce4-terminal --noconfirm
sudo pacman -S xf86-input-synaptics --noconfirm
sudo pacman -S net-tools --noconfirm
sudo pacman -S networkmanager --noconfirm
sudo pacman -S network-manager-applet --noconfirm
sudo pacman -S gnome-keyring --noconfirm
sudo pacman -S fprintd --noconfirm
sudo pacman -S lib32-libldap --noconfirm
sudo pacman -S lib32-alsa-lib --noconfirm
sudo pacman -S lib32-alsa-plugins --noconfirm
sudo pacman -S lib32-alsa-oss --noconfirm
sudo pacman -S lib32-libpulse --noconfirm
sudo pacman -S lib32-openal --noconfirm
sudo pacman -S gksu --noconfirm

# Internet
sudo pacman -S rsync --noconfirm
sudo pacman -S sshfs --noconfirm
sudo pacman -S tigervnc --noconfirm
sudo pacman -S hexchat --noconfirm
sudo pacman -S irssi --noconfirm
sudo pacman -S skype --noconfirm
sudo pacman -S thunderbird --noconfirm
sudo pacman -S firefox --noconfirm
sudo pacman -S chromium --noconfirm
sudo pacman -S owncloud-client --noconfirm

# Entertainment
sudo pacman -S vlc --noconfirm
sudo pacman -S steam --noconfirm
sudo pacman -S playonlinux --noconfirm

# Utils
sudo pacman -S gparted --noconfirm
sudo pacman -S nautilus --noconfirm

# Misc
sudo pacman -S redshift --noconfirm
sudo pacman -S cowsay --noconfirm
sudo pacman -S sl --noconfirm

# Install pacaur AUR helper
git clone https://aur.archlinux.org/pacaur.git
git clone https://aur.archlinux.org/cower.git
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
cd cower
makepkg -sri --noconfirm
cd ../pacaur
makepkg -sri --noconfirm
cd ..
rm -rf pacaur cower

# Install (Pacaur)
# IDEs
pacaur -S intellij-idea-ultimate-edition --noconfirm --noedit
pacaur -S clion --noconfirm --noedit
pacaur -S webstorm --noconfirm --noedit
pacaur -S pycharm-professional --noconfirm --noedit
pacaur -S android-studio --noconfirm --noedit
pacaur -S numix-icon-theme-square --noconfirm --noedit
pacaur -S pacaur -S numix-icon-theme-square --noconfirm --noedit
pacaur -S gtk-theme-arc --noconfirm --noedit

# Uninstall
sudo pacman -Rcns pamac

# Services
sudo systemctl disable dhcpcd@ens33.service
sudo systemctl disable dhcpcd.service
sudo systemctl enable gdm.service
sudo systemctl enable NetworkManager

# Enroll fingerprints
sudo sed -i '2iauth      sufficient pam_fprintd.so' /etc/pam.d/*
fprintd-enroll
fprintd-enroll -f right-middle-finger

# Add Bookmarks
mkdir $HOME/.config
mkdir $HOME/.config/gtk-3.0
touch $HOME/.config/gtk-3.0/bookmarks
echo "sftp://www.krumreyh.de@ssh.strato.de/ Strato" >> $HOME/.config/gtk-3.0/bookmarks
echo "sftp://hermann@krumreyh.asuscomm.com:9022/mnt/Main FreeNAS" >> $HOME/.config/gtk-3.0/bookmarks
echo "sftp://hermann@gitlab.namibsun.net/ Vserver" >> $HOME/.config/gtk-3.0/bookmarks

# Edit bashrc
mkdir $HOME/.bin
echo "PATH=\$PATH:\$HOME/.bin" >> $HOME/.bashrc
echo "PATH=\$PATH:\$HOME/.local/bin" >> $HOME/.bashrc
echo "alias brew=\"sudo pacman -S\"" >> $HOME/.bashrc
echo "alias update=\"sudo pacman -Syu\"" >> $HOME/.bashrc
echo "alias pipinstall=\"pip install --user\"" ?? $HOME/.bashrc
echo "echo \"Help, I'm trapped in a terminal!\" | cowsay -f tux" >> $HOME/.bashrc

# Update Grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# create mount-temp script
mkdir $HOME/Temp
echo '#!/bin/bash' >> $HOME/.bin/mount-temp
echo "sshfs -o idmap=user hermann@krumreyh.asuscomm.com:/mnt/Main/Temp/ \$HOME/Temp/ -p 9022" >> $HOME/.bin/mount-temp
sudo chmod 755 $HOME/.bin/mount-temp

# Create rsync-backup script
echo '#!/bin/bash' >> $HOME/.bin/rsync-backup
echo "echo \"Home:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after '/home/hermann/' hermann@192.168.1.2:/mnt/Main/Backups/Home/x250" >> $HOME/.bin/rsync-backup
sudo chmod 755 $HOME/.bin/rsync-backup

# JETBRAINS IDEs
mkdir $HOME/Documents
mkdir $HOME/Documents/Programming
mkdir $HOME/Documents/Programming/Java
mkdir $HOME/Documents/Programming/Python
mkdir $HOME/Documents/Programming/C-C++
mkdir $HOME/Documents/Programming/HTML
mkdir $HOME/Documents/Programming/Bash

reboot

# After Installation:
# Set up themes, shortcuts, background
