#!/bin/bash

#vlc no-tear
scp hermann@192.168.1.2:/mnt/Main/Defaults/configs/HK-03/programs/vlc.zip $HOME/vlc.zip
unzip $HOME/vlc.zip -d $HOME/.config/vlc
rm $HOME/vlc.zip

#Owncloud
mkdir $HOME/.local/share/data
scp hermann@192.168.1.2:/mnt/Main/Defaults/configs/HK-03/programs/ownCloud.zip $HOME/ownCloud.zip
unzip $HOME/ownCloud.zip -d $HOME/.local/share/data/ownCloud
rm $HOME/ownCloud.zip
