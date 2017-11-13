#!/bin/bash
#This file is part of install-scripts.

# Foobar is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Foobar is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

mkdir -p ~/.local/bin
mkdir -p ~/Temp

echo '[[ $- != *i* ]] && return
export PS1="[\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;27m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]"
alias ls="ls --color=auto -lh"
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/nano
VISUAL=/usr/bin/nano
PATH=$PATH:~/.local/bin
alias mount-temp="sshfs -o idmap=user hermann@192.168.1.2:/mnt/Main/Temp ~/Temp"
' > ~/.bashrc

source ~/.bashrc