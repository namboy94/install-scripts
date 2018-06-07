"""LICENSE
Copyright 2017 Hermann Krumrey <hermann@krumreyh.com>

This file is part of install-scripts.

install-scripts is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

install-scripts is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with install-scripts.  If not, see <http://www.gnu.org/licenses/>.
LICENSE"""

import os
from install_scripts.distros import Distros
from install_scripts.helper import process_call


def base(distro: Distros):
    """
    Write a base bashrc file
    :return: None
    """
    process_call([
        "mkdir", "-p", os.path.join(os.path.expanduser("~"), ".local/bin")
    ])

    lines = [
        "[[ $- != *i* ]] && return",
        "alias ls=\"ls --color=auto -lh\"",
        "BROWSER=/usr/bin/firefox",
        "EDITOR=/usr/bin/nano",
        "VISUAL=/usr/bin/nano",
        "PATH=$PATH:~/.local/bin",
        "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk",
        "alias youtube-mp3=\"youtube-dl --extract-audio --audio-format mp3\""
    ]

    # Adjust ls alias for freenas
    if distro == Distros.FREENAS:
        lines[1] = "alias ls=\"ls -lhG\""

    with open(os.path.join(os.path.expanduser("~"), ".bashrc"), "w") as bashrc:
        bashrc.writelines(lines)


def add_line_to_bashrc(line: str):
    """
    Adds a line to bashrc
    :param line: The line to add
    :return: None
    """

    with open(os.path.join(os.path.expanduser("~"), ".bashrc"), "a") as bashrc:
        bashrc.write(line)


def add_nas_bashrc_lines(desktop: bool):
    """
    Adds NAS-related lines to the .bashrc files
    :param desktop: Specifies if this is for a desktop or not
    :return: None
    """

    process_call([
        "mkdir", "-p", os.path.join(os.path.expanduser("~"), "freenas")
    ])

    if desktop:
        lines = [
            "alias mount-temp=\"sshfs -o idmap=user "
            "hermann@192.168.1.2:/mnt/Main/ ~/freenas\"",
            "alias backup=\"rsync -av --delete-after ~/ "
            "192.168.1.2:/mnt/Main/Backups/Linux/$(hostname -f)\"",
            "alias media-upload='"
            "rsync -av --delete-after"
            "/run/media/hermann/Japanese\\ Media/Japanese\\ Media/ "
            "\"192.168.1.2:/mnt/Main/Storage/Japanese\\ Media\"; "
            "rsync -av --delete-after "
            "/run/media/hermann/Media/Media/ "
            "192.168.1.2:/mnt/Main/Storage/Media"
        ]
    else:
        lines = [
            "alias mount-temp=\"sshfs -o idmap=user -p 9022 "
            "hermann@krumreyh.asuscomm.com:/mnt/Main/ ~/freenas\"",
            "alias backup=\"rsync -av --delete-after -e \"ssh -p 9022\" ~/ "
            "192.168.1.2:/mnt/Main/Backups/Linux/$(hostname -f)\"",
        ]

    for line in lines:
        add_line_to_bashrc(line)