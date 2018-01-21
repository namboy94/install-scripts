#!/bin/bash
# Copyright 2017,2018 Hermann Krumrey <hermann@krumreyh.com>
#
# This file is part of install-scripts.
#
# install-scripts is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# install-scripts is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with install-scripts.  If not, see <http://www.gnu.org/licenses/>.

mkdir -p ~/.local/bin
mkdir -p ~/Temp

wget https://raw.githubusercontent.com/will8211/unimatrix/369256134093b62910b31ae505765301cff46d38/unimatrix.py -O ~/.local/bin/unimatrix
chmod 755 ~/.local/bin/unimatrix

echo '[[ $- != *i* ]] && return
export PS1="[\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;27m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]"
alias ls="ls --color=auto -lh"
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/nano
VISUAL=/usr/bin/nano
PATH=$PATH:~/.local/bin
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
alias mount-temp="sshfs -o idmap=user hermann@192.168.1.2:/mnt/Main/Temp ~/Temp"
~/.local/bin/unimatrix -t 2 -n -s 96 -l o
' > ~/.bashrc

echo '
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
' > ~/.profile

source ~/.bashrc