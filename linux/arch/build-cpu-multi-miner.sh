#!/bin/bash
# Copyright 2017 Hermann Krumrey <hermann@krumreyh.com>
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

sudo pacman -Syy git gcc make autoconf automake autogen curl jansson openssl
rm -rf cpuminer-multi
git clone https://github.com/tpruvot/cpuminer-multi.git
cd cpuminer-multi
./build.sh