#!/usr/bin/env bash

# Load helper functions
# https://stackoverflow.com/a/242550
BASEDIR=$(dirname "$0")
. "$BASEDIR/.functions.sh"

# https://itsfoss.com/install-fonts-ubuntu/
DIR_FONTS="$HOME/.fonts"
mkdir -p "$DIR_FONTS"

echo "1. Installing user fonts:"
echo "$DIR_FONTS"
echo "-------------------------"
cd "$DIR_FONTS"
echo "Fetching Cascadia Code from GitHub"
# https://github.com/microsoft/cascadia-code
URL=$(fetch_github_download_url "microsoft/cascadia-code" ".*ttf")
fetch_file -O "cascadia-code.ttf" "$URL"

# TypeCatcher is part of Ubuntu repository:
# https://launchpad.net/ubuntu/disco/+source/typecatcher
#sudo add-apt-repository ppa:andrewsomething/typecatcher

echo "2. Installing fonts and font utilities"
# TypeCatcher – Download Google webfonts on the Linux desktop
# https://github.com/andrewsomething/typecatcher
sudo apt update && sudo apt install \
  font-manager \
  fonts-firacode \
  typecatcher
