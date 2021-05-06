#!/bin/bash


log() {
    echo "$(date) - ${1}" >> /home/pi/.start-app.log
}

log "Running script as $(whoami)"

node=$(which node)
if [[ -z ${node} ]]; then
    log "node executable not found, installing now"
    cd /home/pi
    file=node-v11.15.0-linux-armv6l
    log "Downloading nodejs"
    wget "https://nodejs.org/dist/v11.15.0/${file}.tar.xz"
    if [[ ! -f "${file}.tar.xz" ]]; then
        log "File ${file}.tar.xz not found!"
        exit 1
    fi
    tar -xvf ${file}.tar.xz
    sudo cp -R ${file}/* /usr/local/
    rm -rf ${file}*
else
    log "${node} executable found, continuing to run application"
fi

if [[ ! -d /home/pi/Adafruit-WebIDE ]]; then
    log "Adafruit-WebIDE application directory not found, installing now"
    cd /home/pi
    log "Updating apt-get"
    sudo apt-get update
    log "Installing git"
    sudo apt-get install -y git python3-pip
    git config --global user.name "Adafruite WebIDE"
    git config --global user.email ide-user@example.com

    # install webide
    cd /home/pi
    log "Cloning Adafruit-WebIDE and installing"
    git clone git://github.com/adafruit/Adafruit-WebIDE.git
    cd Adafruit-WebIDE
    mkdir -p tmp
    log "npm command: $(which npm)"
    log "setting npm config tmp dir"
    npm config set tmp tmp
    log "running npm install"
    npm install
    log "setting pi ownership of directory"
    sudo chown -R pi ./*
fi

pip3List=$(pip3 list)
if [[ -z $(echo ${pip3List} | grep -F asyncio) || -z $(echo ${pip3List} | grep -F python-kasa) ]]; then
    # Ensure packages are installed for both pi and root users
    log "Installing asyncio"
    pip3 install asyncio
    sudo pip3 install asyncio
    log "Installing python-kasa"
    pip3 install python-kasa
    sudo pip3 install python-kasa
fi

cd /home/pi/Adafruit-WebIDE
log "Starting the app via server.js"
node server.js
