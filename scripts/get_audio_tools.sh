#!/bin/bash

# 1. Lollypop
# https://gitlab.gnome.org/gnumdk/lollypop
# https://launchpad.net/~gnumdk/+archive/ubuntu/lollypop
sudo add-apt-repository ppa:gnumdk/lollypop
# Missing Public Key
# echo "deb http://ppa.launchpad.net/gnumdk/lollypop/ubuntu disco main" \
#   | sudo tee /etc/apt/sources.list.d/lollypop.list
# echo "deb-src http://ppa.launchpad.net/gnumdk/lollypop/ubuntu disco main" \
#   >> /etc/apt/sources.list.d/lollypop.list

# 2. MusicBrainz Picard
# https://picard.musicbrainz.org/
# https://launchpad.net/~musicbrainz-developers/+archive/ubuntu/stable
sudo add-apt-repository ppa:musicbrainz-developers/stable
# Missing Public Key
# echo "deb http://ppa.launchpad.net/musicbrainz-developers/stable/ubuntu disco main" \
#   | sudo tee /etc/apt/sources.list.d/picard.list
# echo "deb-src http://ppa.launchpad.net/musicbrainz-developers/stable/ubuntu disco main" \
#   >> /etc/apt/sources.list.d/picard.list

sudo apt update && sudo apt install --yes \
  lollypop \
  picard
