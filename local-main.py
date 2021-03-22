import asyncio
import os.path
from kasa import Discover
from kasa import SmartPlug
from os import path

device_name = os.environ.get('DEVICE_NAME')

def setup_device_info():
    devices = asyncio.run(Discover.discover())
    for addr, dev in devices.items():
        asyncio.run(dev.update())
        if dev.alias == device_name:
            print("Found device")
            f = open("device-ip.txt", "a")
            f.write(addr)
            f.close()

async def get_device():
    f = open("device-ip.txt", "r")
    device = SmartPlug(f.read())
    await device.update()
    await device.turn_off()

if not path.exists("device-ip.txt"):
    print("Device IP not known, discovering devices now")
    setup_device_info()

asyncio.run(get_device())
