from tplinkcloud import TPLinkDeviceManager
import os, sys, time
import RPi.GPIO as GPIO


tplink_user = os.environ.get('TPLINK_USERNAME')
tplink_pass = os.environ.get('TPLINK_PASSWORD')
device_name = os.environ.get('DEVICE_NAME')

device_manager = TPLinkDeviceManager(tplink_user, tplink_pass)
device = device_manager.find_device(device_name)
if device is None:
  print(f'Could not find device {device_name}')
  exit(1)


GPIO.setmode(GPIO.BCM)
DOOR_SENSOR_PIN = 18
GPIO.setup(DOOR_SENSOR_PIN, GPIO.IN, pull_up_down = GPIO.PUD_UP)

isOpen = None
oldIsOpen = None

# Clean up when thef user exits with keyboard interrupt
def cleanupLights(signal, frame):
    GPIO.cleanup()
    sys.exit(0)

while True:
    oldIsOpen = isOpen
    isOpen = GPIO.input(DOOR_SENSOR_PIN)
    if (isOpen and (isOpen != oldIsOpen)):
        print("open")
        device.power_on()
    elif (isOpen != oldIsOpen):
        print("closed")
        device.power_off()
    time.sleep(1)
