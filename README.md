# pi-sensor-light-demo

This tool controls a TP-Link smart outlet based on the status of a magnetic sensor. When the magnetic contact is closed the light will turn off, and when the contact is open the light will turn on.

---
## Installation

### Basic Configuration

Follow the setup instructions for the smart plug to get it connected to your wifi. Ensure your Raspberry Pi is connected to your wifi. The tool is configured to use [GPIO 18](https://pinout.xyz/pinout/pin12_gpio18) and a ground wire.

One line installation:

```
bash <(curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/andrewmarklloyd/pi-sensor-light-demo/master/setup.sh)
```

---
## Required Hardware

- [Raspberry Pi 3](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) but any Raspberry Pi will work
- [Kasa Smart Plug Mini](https://www.amazon.com/gp/product/B07TXM4MT3/ref=ppx_yo_dt_b_search_asin_image?ie=UTF8&psc=1)
- [Surface Mount Alarm Magnetic Contact](https://www.amazon.com/gp/product/B00LYCUSBY/ref=ppx_yo_dt_b_search_asin_image?ie=UTF8&psc=1)