#!/bin/bash


sudo apt-get update
sudo apt-get install python3-pip -y
pip3 install tplink-cloud-api
pip3 install RPi.GPIO

curl -O -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/andrewmarklloyd/pi-sensor-light-demo/master/main.py
curl -O -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/andrewmarklloyd/pi-sensor-light-demo/master/run.sh.tmpl


echo "Enter the TP Link account username:"
read -r TPLINK_USERNAME
echo "Enter the TP Link account password:"
read -s TPLINK_PASSWORD
echo "Enter the device name:"
read -r DEVICE_NAME

# Use ~ as a delimter instead of /
sed "s~{{.TPLINK_USERNAME}}~${TPLINK_USERNAME}~" run.sh.tmpl \
    | sed "s~{{.TPLINK_PASSWORD}}~${TPLINK_PASSWORD}~" \
    | sed "s~{{.DEVICE_NAME}}~${DEVICE_NAME}~" > run.sh

chmod +x run.sh
rm run.sh.tmpl
