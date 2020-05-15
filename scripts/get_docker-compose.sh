#!/bin/bash

BIN_DIR="/usr/local/bin"
BIN_NAME="docker-compose"
VERSION="1.25.5"

echo "Install $BIN_NAME"
echo "More info: https://docs.docker.com/compose/install/"
echo "---------------------------------------------------"

echo "1. Download version $VERSION"
DOWNLOAD_URL="https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m)"
DOWNLOAD_TARGET="$BIN_DIR/$BIN_NAME"
sudo curl -L "$DOWNLOAD_URL" -o $DOWNLOAD_TARGET

echo "2. Set binary executable"
sudo chmod +x "$DOWNLOAD_TARGET"

echo ""
echo "$BIN_NAME successfully installed!"
echo $(sh -c "$DOWNLOAD_TARGET --version")
echo "-------------------------------------------"

exit 0