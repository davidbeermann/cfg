#!/bin/bash

BIN_NAME=typora

echo "Install $BIN_NAME"
echo "More info: https://typora.io/"
echo "-----------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget is not installed.' >&2
  exit 1
fi

echo "1. Adding Debian package repository"
# https://support.typora.io/Typora-on-Linux/
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'

echo "2. Installing $BIN_NAME"
sudo apt update --quiet && sudo apt install --yes "$BIN_NAME"

exit 0
