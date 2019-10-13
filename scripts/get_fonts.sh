#!/bin/bash

# https://itsfoss.com/install-fonts-ubuntu/
mkdir -p ~/.fonts

# Download Google webfonts on the Linux desktop
# https://github.com/andrewsomething/typecatcher
# TypeCatcher is part of Ubuntu repository:
# https://launchpad.net/ubuntu/disco/+source/typecatcher
#sudo add-apt-repository ppa:andrewsomething/typecatcher

sudo apt update && sudo apt install \
  font-manager \
  fonts-firacode \
  typecatcher
