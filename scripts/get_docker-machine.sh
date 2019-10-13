#!/bin/bash

BIN_NAME="docker-machine"

echo "Install $BIN_NAME"
echo "More info: https://docs.docker.com/machine/overview/"
echo "----------------------------------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget is not installed.' >&2
  exit 1
fi

echo "1. Fetching latest release url from GitHub"
# https://docs.docker.com/machine/install-machine/
# https://github.com/docker/machine/releases
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
# https://stackoverflow.com/a/29457649
PLATFORM=$(uname -s)
ARCH=$(uname -m)
URL=$(wget -O- -q --show-progress --progress=bar:force:noscroll \
  https://api.github.com/repos/docker/machine/releases/latest \
  | grep "\"browser_download_url\": \".*$PLATFORM-$ARCH\"" \
  | sed -E 's/.*"([^"]+)".*/\1/')

BIN_DIR="/usr/local/bin"

echo "2. Downloading to $BIN_DIR"
sudo mkdir -p $BIN_DIR
cd $BIN_DIR
sudo wget -q --show-progress --progress=bar:force:noscroll -O "$BIN_NAME" "$URL"
sudo chmod +x "$BIN_NAME"

echo ""
echo "$BIN_NAME successfully installed!"
echo $(sh -c "$BIN_DIR/$BIN_NAME --version")
echo "-------------------------------------------"
echo "Run \`source ~/.profile\` to reload binaries."

exit 0
