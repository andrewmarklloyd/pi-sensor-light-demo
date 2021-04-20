# pi-sensor-light-demo

This tool controls a TP-Link smart outlet based on the status of a magnetic sensor. This repo is meant to install the [Adafruit-WebIDE](https://github.com/adafruit/Adafruit-WebIDE) on a Raspberry Pi to make it easier for new programmers to edit code on the Pi. It includes steps to configure a smart outlet, pull and use the Python script using the web IDE and continue to develop applications. The installation instructions are Mac OS specific but can be translated to other operating systems.

---
## Installation

The installation process involves two steps:
- Write the Raspberry Pi operating system to the SD card from a computer and configure startup scripts
- After inserting the card into the Pi and powering it up, the web IDE is installed and configured
It is required to configure the Wifi before starting the Pi

## Basic Configuration

Writing Operating System to the SD card
- Install the [Raspberry Pi Imager](https://www.raspberrypi.org/software/) on your MacOS
- Insert SD card into the Mac card reader and open the Raspberry Pi Imager application
- Use the command strokes `command-shift-x` to open the advanced option menu. At the time of this writing, it is required to use the advanced option menu to configure Wifi. See this [blog post](https://www.raspberrypi.org/blog/raspberry-pi-imager-update-to-v1-6/) for more information.
- Use the `Configure Wifi` section to enter your Wifi SSID and password. **Note**: Raspberry Pi Zero only supports 2.4GHz.
- If configuring more than one Raspberry Pi on a network use the `Set hostname` setting to configure a _unique_ hostname for each Pi
- Do **not** select "Eject media when finished"
- Click the `SAVE` button
- Select the `Raspberry Pi OA (32-bit)` option and the SD card storage options
- Write the OS to the SD card
- After the RPi Imager has finished writing to the card open the `terminal` application and run the following commands. This will copy installation scripts to allow the Pi to install and configure the web IDE with no human interaction.
    ```
    git clone git@github.com:andrewmarklloyd/pi-sensor-light-demo.git
    cd pi-sensor-light-demo/basic/
    ./configure-boot-drive.sh
    ```
- At this point the SD card is fully configured and can be safely ejected

Powering up the Pi
- Insert the SD card into the Pi and power it up. After a few minutes the installation will complete and you can navigate to http://<pi-hostname.local>:3000 in your web browser to view the Web IDE

Follow the setup instructions for the smart plug to get it connected to your wifi. Ensure your Raspberry Pi is connected to your wifi. The tool is configured to use [GPIO 18](https://pinout.xyz/pinout/pin12_gpio18) and a ground wire.


## Advanced Configuration

This section is a work in progress and will be geared towards an `ssh` based installation.

---
## Required Hardware

- [Raspberry Pi 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) but any Raspberry Pi will work
- [Kasa Smart Plug Mini](https://www.amazon.com/gp/product/B07TXM4MT3/ref=ppx_yo_dt_b_search_asin_image?ie=UTF8&psc=1)
- [Surface Mount Alarm Magnetic Contact](https://www.amazon.com/gp/product/B00LYCUSBY/ref=ppx_yo_dt_b_search_asin_image?ie=UTF8&psc=1)