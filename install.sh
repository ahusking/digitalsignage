#!/bin/bash

echo cleanup apps we dont need
sudo apt-get remove --purge wolfram-engine scratch nuscratch sonic-pi idle3 smartsim java-common minecraft-pi python-minecraftpi python3-minecraftpi
echo update apt repos
sudo apt-get update
echo install extra tools for signage
apt-get install xdotool unclutter chromium-browser
echo make directories for autostart
mkdir ~/.config/autostart
echo download autostart config
curl -o ~/.config/autostart/kiosk.desktop https://raw.githubusercontent.com/ahusking/digitalsignage/master/kiosk.desktop
echo download kiosk script
curl -o ~/kiosk.sh https://raw.githubusercontent.com/ahusking/digitalsignage/master/kiosk.sh
bash ~/kiosk.sh
