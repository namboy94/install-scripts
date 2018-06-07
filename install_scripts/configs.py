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


from typing import Dict, List, Tuple, Callable
from install_scripts.arch import install_essentials
from install_scripts.cryptomining import build_cpuminer_multi


MACHINE_CONFIGS = {
    "x250": [
        (install_essentials, (True,))
    ],
    "hermann-desktop": [
        (install_essentials, (True,))
    ],
    "freenas": [

    ],
    "ubuntu-server": [

    ],
    "namibsun": [

    ]
}


APPLICATION_CONFIGS = {
    "cpuminer-multi": [
        (build_cpuminer_multi, ())
    ]
}


def execute_config(entry: str,
                   config: Dict[str, List[Tuple[Callable, Tuple]]]):
    """
    Executes a configuration
    :param entry: The entry in the configuration to execute
    :param config: The configuration
    :return: None
    """

    commands = config[entry]
    for command in commands:
        command[0](*command[1])
