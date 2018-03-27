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

sudo bash -c "echo -e '\n\n# -- Block all of Reddit --\n127.0.0.1\t\treddit.com\n127.0.0.1\t\twww.reddit.com\n127.0.0.1\t\tnp.reddit.com\n127.0.0.1\t\tssl.reddit.com\n127.0.0.1\t\tblog.reddit.com\n127.0.0.1\t\tfr.reddit.com\n127.0.0.1\t\tpay.reddit.com\n127.0.0.1\t\tes.reddit.com\n127.0.0.1\t\ten-us.reddit.com\n127.0.0.1\t\ten.reddit.com\n127.0.0.1\t\tru.reddit.com\n127.0.0.1\t\tus.reddit.com\n127.0.0.1\t\tde.reddit.com\n127.0.0.1\t\tdd.reddit.com\n127.0.0.1\t\tno.reddit.com\n127.0.0.1\t\tpt.reddit.com\n127.0.0.1\t\tww.reddit.com\n127.0.0.1\t\tss.reddit.com\n127.0.0.1\t\t4x.reddit.com\n127.0.0.1\t\tsv.reddit.com\n127.0.0.1\t\tnl.reddit.com\n127.0.0.1\t\thw.reddit.com\n127.0.0.1\t\thr.reddit.com' >> /etc/hosts"