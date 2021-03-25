#!/bin/bash

# temporary workaround until I figure out how to install all dependencies via firstrun.sh or rc.local 
which pip3 || sudo apt-get update && sudo apt-get install python3-pip -y
pip3 list | grep -F tplink-cloud-api || pip3 install tplink-cloud-api
pip3 list | grep -F RPi.GPIO || pip3 install RPi.GPIO

if [[ ! -f main.py ]]; then
    baseUrl="https://raw.githubusercontent.com/andrewmarklloyd/pi-sensor-light-demo/master"
    curl -o /home/pi/main.py -s -H 'Cache-Control: no-cache' "${baseUrl}/main.py"
fi

python3 main.py
