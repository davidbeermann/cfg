#!/bin/bash

# Usefull binaries from distribution
# ----------------------------------
# FileZilla – FTP Client: https://wiki.filezilla-project.org/Client_Installation#Installing_on_GNU.2FLinux_and_other_Unix.28-like.29_systems
# GNOME Sushi – File Preview in Nautilus Desktop: https://gitlab.gnome.org/GNOME/sushi
# Peek – Screencast utility: https://github.com/phw/peek
# Shotwell –  Personal Photo Manager: https://wiki.gnome.org/Apps/Shotwell
sudo apt update --quiet && sudo apt install --yes \
  filezilla \
  gnome-sushi \
  gnome-tweaks \
  google-chrome-stable \
  htop \
  peek \
  shotwell \
  slack-desktop \
  thunderbird \
  vim

# Increase the amount of inotify file watchers
# https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers
# https://unix.stackexchange.com/a/13757
# https://askubuntu.com/a/155426
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
