#!/bin/bash

echo '[[ $- != *i* ]] && return
export PS1="[\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;27m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]"
alias ls="ls --color=auto"
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/nano
VISUAL=/usr/bin/nano
PATH=$PATH:~/.local/bin
' > ~/.bashrc