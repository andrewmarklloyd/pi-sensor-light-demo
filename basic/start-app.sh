#!/bin/bash

if [[ ! -d /home/pi/Adafruit-WebIDE ]]; then
    apt-get update
    apt-get install -y git
    git config --global user.name "Adafruite WebIDE"
    git config --global user.email ide-user@example.com

    # temporary workaround until I figure out how to install all dependencies via firstrun.sh or rc.local
    pip3 install asyncio
    pip3 install python-kasa

    # install webide
    cd /home/pi
    git clone git://github.com/adafruit/Adafruit-WebIDE.git
    cd Adafruit-WebIDE
    mkdir tmp
    npm config set tmp tmp
    npm install
    sudo chown -R pi ./*

    # configure systemd
    log "Moving systemd unit file to dir"
    mv ${bootDir}/adafruit-webide.service /etc/systemd/system/
    log "Moving start-app script to /home/pi"
    mv ${bootDir}/start-app.sh /home/pi/
    log "enabling systemd unit"
    systemctl enable adafruit-webide.service
    log "starting systemd unit"
    systemctl start adafruit-webide.service
    log "removing file ${initFile}"
    rm ${initFile}
fi

cd /home/pi/Adafruit-WebIDE
node server.js
