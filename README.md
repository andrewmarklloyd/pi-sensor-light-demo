# pi-sensor-light-demo

This tool controls a TP-Link smart outlet based on the status of a magnetic sensor. This repo is meant to install the [Adafruit-WebIDE](https://github.com/adafruit/Adafruit-WebIDE) on a Raspberry Pi to make it easier for new programmers to edit code on the Pi-Zero. It includes steps to configure a smart outlet and use a Python script using the web IDE. The installation instructions are Mac OS specific but can be translated to other operating systems.

---
## Installation

- Insert SD card into the Mac card reader
- Open the `finder` app and change the name of the SD card to `boot`
- Install the [Raspberry Pi Imager](https://www.raspberrypi.org/software/) on your MacOS
- Open the Raspberry Pi Imager application
- Use the command strokes `command-shift-x` to open the advanced option menu. At the time of this writing, it is required to use the advanced option menu to configure Wifi. See this [blog post](https://www.raspberrypi.org/blog/raspberry-pi-imager-update-to-v1-6/) for more information.
- `**Note**` If you are using Wifi to connect the Pi-Zero to the internet follow this step. If not then skip this step. Use the `Configure Wifi` section to enter your Wifi SSID and password. **Note**: Raspberry Pi Zero only supports 2.4GHz.
- If configuring more than one Raspberry Pi on a network use the `Set hostname` setting to configure a _unique_ hostname for each Pi
- Do **not** select "Eject media when finished"
- Click the `SAVE` button
- Select the `Raspberry Pi OA (32-bit)` option and the SD card storage options
- Write the OS to the SD card
- After the RPi Imager has finished writing to the card open the `terminal` application and run the following commands. This will copy installation scripts to allow the Pi to install and configure the web IDE automatically.
    ```
    cd /tmp
    git clone https://github.com/andrewmarklloyd/pi-sensor-light-demo.git
    cd pi-sensor-light-demo/install/
    ./configure-boot-drive.sh
    ```
- At this point the SD card is fully configured and can be safely ejected

- Insert the SD card into the Pi and power it up. After a few minutes the installation will complete and you can navigate to http://`hostname`.local:3000 in your web browser to view the Web IDE, using the `hostname` you set when writing the pi.

## Configuring the Smart Outlet

On your smartphone download the `Kasa Smart` app.
- [Android](https://play.google.com/store/apps/details?id=com.tplink.kasa_android&hl=en_US&gl=US)
- [iPhone](https://apps.apple.com/us/app/kasa-smart/id1034035493)

Follow the setup instructions in the app to connect the smart outlet to Wifi. **Note** the Kasa Smart Plug requires a 2.4Ghz WPA2 password protected Wifi network.

## Connecting the Sensor 

Connect one jumper wire to [GPIO 18](https://pinout.xyz/pinout/pin12_gpio18) and the other to a ground pin.

## Running the Application

In the Web IDE, create a new filed named `main.py` and copy [main.py](https://github.com/andrewmarklloyd/pi-sensor-light-demo/blob/main/main.py) into it.

---
## Required Hardware

- [Raspberry Pi 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) but any Raspberry Pi will work
- [Kasa Smart Plug Mini](https://www.amazon.com/gp/product/B07TXM4MT3/ref=ppx_yo_dt_b_search_asin_image?ie=UTF8&psc=1)
- [Surface Mount Alarm Magnetic Contact](https://www.amazon.com/gp/product/B00LYCUSBY/ref=ppx_yo_dt_b_search_asin_image?ie=UTF8&psc=1)
- If using ethernet instead of Wifi: [Ethernet Adapter](https://www.amazon.com/Plugable-Ethernet-Compatible-Raspberry-AX88772A/dp/B00RM3KXAU/ref=sr_1_3?dchild=1&keywords=Pi+Zero+Ethernet&qid=1620264412&sr=8-3)