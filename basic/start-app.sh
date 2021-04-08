#!/bin/bash


log() {
    echo "${1}" >> /home/pi/.start-app.log
}

log "Running script as $(whoami)"

if [[ ! -d /home/pi/Adafruit-WebIDE ]]; then
    cd /home/pi
    log "Updating apt-get"
    sudo apt-get update
    log "Installing git"
    sudo apt-get install -y git python3-pip
    git config --global user.name "Adafruite WebIDE"
    git config --global user.email ide-user@example.com

    # temporary workaround until I figure out how to install all dependencies via firstrun.sh or rc.local
    log "Installing asyncio"
    pip3 install asyncio
    log "Installing python-kasa"
    pip3 install python-kasa

    # install webide
    cd /home/pi
    log "Cloning Adafruit-WebIDE and installing"
    git clone git://github.com/adafruit/Adafruit-WebIDE.git
    cd Adafruit-WebIDE
    mkdir tmp
    log "npm config set tmp tmp"
    npm config set tmp tmp
    log "running npm install"
    npm install
    log "setting pi ownership of directory"
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
