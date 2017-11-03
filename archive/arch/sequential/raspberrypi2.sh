#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
cd ..
chmod 755 common/*
chmod 755 specialized/raspberrypi2/*
common/drivers.sh
specialized/raspberrypi2/drivers.sh
common/initial.sh
specialized/raspberrypi2/initial.sh
common/programs.sh
specialized/raspberrypi2/programs.sh
common/python.sh
