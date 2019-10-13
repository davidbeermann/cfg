#!/bin/bash

# https://askubuntu.com/questions/346211/tracker-store-and-tracker-miner-fs-eating-up-my-cpu-on-every-startup
# https://gist.github.com/Prezto/75d612cebc9300f83bc74830df3a6410

echo -e "\nHidden=true\n"|sudo tee --append /etc/xdg/autostart/tracker-extract.desktop
echo -e "\nHidden=true\n"|sudo tee --append /etc/xdg/autostart/tracker-miner-apps.desktop
echo -e "\nHidden=true\n"|sudo tee --append /etc/xdg/autostart/tracker-miner-fs.desktop
echo -e "\nHidden=true\n"|sudo tee --append /etc/xdg/autostart/tracker-miner-user-guides.desktop
echo -e "\nHidden=true\n"|sudo tee --append /etc/xdg/autostart/tracker-store.desktop

gsettings set org.freedesktop.Tracker.Miner.Files crawling-interval -2
gsettings set org.freedesktop.Tracker.Miner.Files enable-monitors false

tracker reset --hard

