#!/bin/bash

file=node-v11.15.0-linux-armv6l
cd
wget https://nodejs.org/dist/v11.15.0/${file}.tar.xz
tar -xvf ${file}.tar.gz.tar.xz
cd ${file}
sudo cp -R * /usr/local/
git clone git://github.com/adafruit/Adafruit-WebIDE.git
cd Adafruit-WebIDE
mkdir tmp
npm config set tmp tmp
npm install
sudo chown -r pi ./*
# editor config/config.js
echo "to change ownership of the directory of the webIDE use this.(its imortant, the webIDE will run when deployed under your credentials... a node bot with root privledges is scary."

echo "to run the server as a background process type: nohup node server.js &"
echo "to run it in this terminal type: node server.js"
echo "the directory where you will want to run the command will be"
