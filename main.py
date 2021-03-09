from tplinkcloud import TPLinkDeviceManager

username='example@email.com'
password='secure'

device_manager = TPLinkDeviceManager(username, password)

devices = device_manager.get_devices()
if devices:
  print(f'Found {len(devices)} devices')
  for device in devices:
    print(f'{device.model_type.name} device called {device.get_alias()}')

device_name = "My Smart Plug"
device = device_manager.find_device(device_name)
if device:
  print(f'Found {device.model_type.name} device: {device.get_alias()}')
  device.toggle()
else:  
  print(f'Could not find {device_name}')

import RPi.GPIO as GPIO #import the GPIO library
import time

GPIO.setmode(GPIO.BOARD)
GPIO.setup(8, GPIO.IN, pull_up_down=GPIO.PUD_UP)


while True:
    if GPIO.input(8):
       print("Door is open")
       time.sleep(2)
    if GPIO.input(8) == False:
       print("Door is closed")
       time.sleep(2)
