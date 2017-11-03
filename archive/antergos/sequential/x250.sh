#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
cd ..
chmod 755 common/*
chmod 755 specialized/x250/*
common/drivers.sh
specialized/x250/drivers.sh
common/initial.sh
specialized/x250/initial.sh
common/programs.sh
specialized/x250/programs.sh
