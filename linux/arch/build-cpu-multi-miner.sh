#!/bin/bash

sudo pacman -Syy git gcc make autoconf automake autogen curl jansson openssl
rm -rf cpuminer-multi
git clone https://github.com/tpruvot/cpuminer-multi.git
cd cpuminer-multi
./build.sh