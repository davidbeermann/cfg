#!/bin/bash

# Usefull binaries from distribution
sudo apt update --quiet && sudo apt install --yes \
  gnome-tweaks \
  google-chrome-stable \
  htop \
  peek \
  slack-desktop \
  thunderbird

# Increase the amount of inotify file watchers
# https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
