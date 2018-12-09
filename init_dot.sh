#!/bin/bash
GIT=$(which git)
if [ -z "$GIT" ]; then
    echo "Git not found!"
    exit 1
fi

# alias dot="$GIT --git-dir=$HOME/.dot/ --work-tree=$HOME"

echo ".dot" >> .gitignore

git clone --bare git@github.com:davidbeermann/dot.git "$HOME/.dot"

# Install Nextcloud client
# https://nextcloud.com/clients/
# https://launchpad.net/~nextcloud-devs/+archive/ubuntu/client
sudo add-apt-repository ppa:nextcloud-devs/client
sudo apt update
sudo apt install nextcloud-client -y

echo "Manual installs"
echo "Keeweb: https://keeweb.info/"
