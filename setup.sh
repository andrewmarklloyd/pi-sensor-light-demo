#!/bin/bash


sudo apt-get update
sudo apt-get install python3-pip -y
pip3 install tplink-cloud-api
pip3 install RPi.GPIO

curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/andrewmarklloyd/pi-sensor-light-demo/master/main.py > main.py
