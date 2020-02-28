#!/usr/bin/env bash

# Load helper functions
# https://stackoverflow.com/a/242550
BASEDIR=$(dirname "$0")
. "$BASEDIR/.functions.sh"

echo "Install DigitalOcean command line interface"
echo "More info: https://github.com/digitalocean/doctl"
echo "------------------------------------------------"

echo "1. Fetching latest binary from GitHub"
FILE="doctl.tar.gz"
URL=$(fetch_github_download_url "digitalocean/doctl" ".*-linux-amd64.tar.gz")
fetch_file -O "$FILE" "$URL"

DIR="$HOME"/bin
echo "2. Install doctl in $DIR"
mkdir -p "$HOME"/bin
tar -xf "$FILE"
chmod +x doctl
mv doctl "$HOME"/bin
rm "$FILE"

echo ""
echo "doctl successfully installed!"
echo ""

exit 0
