#!/bin/bash


bootDir="/Volumes/boot"

cp rc.local ${bootDir}
cp start-app.sh ${bootDir}
cp adafruit-webide.service ${bootDir}

touch ${bootDir}/init-config.txt

sed -i '' '/exit 0/i\
# user edited\
mv /boot/rc.local /etc/\
\
' ${bootDir}/firstrun.sh
