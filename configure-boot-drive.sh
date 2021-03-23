#!/bin/bash


cp rc.local /Volumes/boot
touch /Volumes/boot/config.txt

sed -i '' 's/exit\ 0//g' /Volumes/boot/firstrun.sh

echo "# user edited
date > /home/pi/first-boot.txt
mv /boot/rc.local /etc/

exit 0
" >> /Volumes/boot/firstrun.sh
