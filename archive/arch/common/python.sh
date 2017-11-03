#!/bin/bash

sudo pacman -S python-gobject --noconfirm
sudo pip install tvdb_api
sudo pip install beautifulsoup4
sudo pip install yowsup2
sudo pip install -Iv protobuf==3.0.0-alpha-1
sudo pip2 install tvdb_api
sudo pip2 install beautifulsoup4
sudo pip2 install yowsup2
wget https://launchpad.net/python-weather-api/trunk/0.3.8/+download/pywapi-0.3.8.tar.gz
tar -zxvf pywapi-0.3.8.tar.gz
cd pywapi-0.3.8
python setup.py build
sudo python setup.py install
cd
rm -rf pywapi-0.3.8
tar -zxvf pywapi-0.3.8.tar.gz
cd pywapi-0.3.8
python2 setup.py build
sudo python2 setup.py install
cd
rm -rf pywapi-0.3.8
rm pywapi-0.3.8.tar.gz