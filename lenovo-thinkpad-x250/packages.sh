#!/bin/bash

# Essential
sudo pacman -S firefox thunderbird git rsync sshfs fprintd --noconfirm

# Rust
sudo pacman -S rustup --noconfirm
echo 'export PATH=$PATH:$HOME/.cargo/bin' >> $HOME/.bashrc
rustup default stable
rustup component add rust-src

# Python
sudo pacman -S python-pip --noconfirm
echo 'export PATH=$PATH:$HOME/.local/bin' >> $HOME/.bashrc
pip install --user pep8 nose

# Pacaur
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
git clone https://aur.archlinux.org/pacaur.git
cd pacaur
makepkg -si --noconfirm
cd ..
rm -rf pacaur

# AUR tools
pacaur -S jetbrains-toolbox android-studio sublime-text-dev --noconfirm --noedit

# Themes
pacaur -S gtk-theme-arc-git --noedit --noconfirm
