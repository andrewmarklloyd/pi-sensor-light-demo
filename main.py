import asyncio
import os.path
from kasa import Discover
from kasa import SmartPlug
from os import path
import os, sys, time, signal
import RPi.GPIO as GPIO

def setup_device_info():
    devices = asyncio.run(Discover.discover())
    for addr, dev in devices.items():
        if dev.alias == device_name:
            return addr

async def device_on(address):
    device = SmartPlug(address)
    await device.update()
    await device.turn_on()

async def device_off(address):
    device = SmartPlug(address)
    await device.update()
    await device.turn_off()

device_name = 'alpha'
address = setup_device_info()

GPIO.setmode(GPIO.BCM)
SENSOR_PIN = 18
GPIO.setup(SENSOR_PIN, GPIO.IN, pull_up_down = GPIO.PUD_UP)

isOpen = None
oldIsOpen = None

# Clean up when the user exits with keyboard interrupt
def cleanupLights(signal, frame):
    GPIO.cleanup()
    sys.exit(0)

signal.signal(signal.SIGINT, cleanupLights)

while True:
    oldIsOpen = isOpen
    isOpen = GPIO.input(SENSOR_PIN)
    if (isOpen and (isOpen != oldIsOpen)):
        print("open")
        asyncio.run(device_on())
    elif (isOpen != oldIsOpen):
        print("closed")
        asyncio.run(device_off())
    time.sleep(1)


