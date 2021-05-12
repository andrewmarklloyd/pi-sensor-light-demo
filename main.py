import asyncio
import os.path
from kasa import Discover
from kasa import SmartPlug
from os import path
import os, sys, time, signal
import RPi.GPIO as GPIO


device_name = 'name'
ip_address = 'ip'

async def device_on():
    device = SmartPlug(ip_address)
    await device.update()
    await device.turn_on()

async def device_off():
    device = SmartPlug(ip_address)
    await device.update()
    await device.turn_off()


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

