#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
cd ..
chmod 755 common/*
chmod 755 specialized/HK-03/*
common/drivers.sh
specialized/HK-03/drivers.sh
common/initial.sh
specialized/HK-03/initial.sh
common/programs.sh
specialized/HK-03/programs.sh
