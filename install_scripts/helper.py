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

from typing import List
from colorama import Fore, Style
from subprocess import check_output


def process_call(command: List[str]) -> str:
    """
    Prints a command and executes it.
    If the exit code is not 0, the program will crash.
    :param command: The command to run
    :return: The output of the command call, stripped of whitespace
    """
    print(Fore.CYAN + " ".join(command) + Style.RESET_ALL)
    output = check_output(command).decode()
    print(Fore.MAGENTA + output + Style.RESET_ALL)
    return output.strip()
