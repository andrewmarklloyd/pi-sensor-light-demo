#!/bin/bash


bootDir="boot"
bootVolume="/Volumes/${bootDir}"

cp rc.local ${bootVolume}
cp start-app.sh ${bootVolume}
cp adafruit-webide.service ${bootVolume}

touch ${bootVolume}/init-config.txt

sed -i '' '/exit 0/i\
# user edited\
mv /boot/rc.local /etc/\
\
' ${bootVolume}/firstrun.sh

# add to firstrun wpa_supplicant.conf under network
# scan_ssid=1