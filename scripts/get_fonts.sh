#!/usr/bin/env bash

# Load helper functions
# https://stackoverflow.com/a/242550
BASEDIR=$(dirname "$0")
. "$BASEDIR/.functions.sh"

# https://itsfoss.com/install-fonts-ubuntu/
# https://wiki.ubuntu.com/Fonts
# TODO: According to comment in /etc/fonts/fonts.conf ~/.fonts will be removed in the future.
DIR_FONTS="$HOME/.fonts"
mkdir -p "$DIR_FONTS"

echo "1. Installing user fonts:"
echo "$DIR_FONTS"
echo "-------------------------"
cd "$DIR_FONTS"

echo "Fetching Hack from GitHub"
# https://sourcefoundry.org/hack/
URL=$(fetch_github_download_url "source-foundry/Hack" ".*ttf.tar.gz")
fetch_file -O "hack.tar.gz" "$URL"
tar -xf hack.tar.gz
mv ttf/* .
rm -drf ttf
rm hack.tar.gz

echo "Fetching Cascadia Code from GitHub"
# https://github.com/microsoft/cascadia-code
URL=$(fetch_github_download_url "microsoft/cascadia-code" ".*ttf")
fetch_file -O "cascadia-code.ttf" "$URL"

echo "2. Rebuild font cache"
# This ensures the new user fonts are indexed
sudo fc-cache -f

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
