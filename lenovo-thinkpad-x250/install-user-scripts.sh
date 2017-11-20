#!/bin/bash

cp -rf bin $HOME/.bin
mkdir $HOME/Temp -p
echo 'export PATH=$PATH:$HOME/.bin' >> $HOME/.bashrc
chmod 755 $HOME/.bin/*