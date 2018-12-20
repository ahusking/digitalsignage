#!/bin/bash
echo enable ssh
sudo update-rc.d ssh enable
echo cleanup apps we dont need
sudo apt-get remove --purge wolfram-engine scratch nuscratch sonic-pi idle3 smartsim java-common minecraft-pi python-minecraftpi python3-minecraftpi
echo update apt repos
sudo apt-get update
echo install extra tools for signage
# some reason it wouldn't accept -y using yes command to work around
yes | sudo apt-get install -y xdotool unclutter chromium-browser screen
echo make directories for autostart
mkdir ~/.config/autostart
echo set chromium to be the default browser
echo "export BROWSER=/usr/bin/chromium-browser" > ~./bashrc
echo configure kiosk script to autostart
echo "@bash /home/pi/kiosk.sh" > ~/.config/lxsession/LXDE-pi/autostart
#echo download autostart config
#curl -o ~/.config/autostart/kiosk.desktop https://raw.githubusercontent.com/ahusking/digitalsignage/master/kiosk.desktop
echo download kiosk script
curl -o ~/kiosk.sh https://raw.githubusercontent.com/ahusking/digitalsignage/master/kiosk.sh
bash ~/kiosk.sh
