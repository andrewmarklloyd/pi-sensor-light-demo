#!/bin/bash


bootDir="/Volumes/boot"

if [[ -z ${TPLINK_USERNAME} || -z ${TPLINK_PASSWORD} || -z ${DEVICE_NAME} ]]; then
    echo "The following environment variables are required but one or more are not set: TPLINK_USERNAME, TPLINK_PASSWORD, DEVICE_NAME"
    exit 1
fi
# Use ~ as a delimter instead of /
sed "s~{{.TPLINK_USERNAME}}~${TPLINK_USERNAME}~" pi-sensor-light-demo.service.tmpl \
    | sed "s~{{.TPLINK_PASSWORD}}~${TPLINK_PASSWORD}~" \
    | sed "s~{{.DEVICE_NAME}}~${DEVICE_NAME}~" > ${bootDir}/pi-sensor-light-demo.service

cp rc.local ${bootDir}
cp start-app.sh ${bootDir}

touch ${bootDir}/init-config.txt
touch ${bootDir}/rc_restart.txt

sed -i '' '/exit 0/i\
# user edited\
mv /boot/rc.local /etc/\
\
' ${bootDir}/firstrun.sh
