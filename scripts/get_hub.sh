#!/bin/bash

echo "Install hub"
echo "More info: https://hub.github.com/"
echo "----------------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget is not installed.' >&2
  exit 1
fi
if ! [ -x "$(command -v apt)" ]; then
  echo 'Error: apt is not installed.' >&2
  exit 1
fi

echo "1. Fetching latest release url from GitHub"
# https://github.com/github/hub/releases
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
# https://stackoverflow.com/a/29457649
URL=$(wget -O- -q --show-progress --progress=bar:force:noscroll \
  https://api.github.com/repos/github/hub/releases/latest \
  | grep '"browser_download_url": ".*linux-amd64.*"' \
  | sed -E 's/.*"([^"]+)".*/\1/')

PWD=$(pwd)
TMPDIR=$(mktemp -dt)
echo "2. Downloading to $TMPDIR"
cd "$TMPDIR"
wget -q --show-progress --progress=bar:force:noscroll "$URL"

FILE=$(ls "$TMPDIR")

echo "3. Unpacking archive $FILE"
# https://www.cyberciti.biz/faq/unpack-tgz-linux-command-line/
tar zxf "$FILE"
rm "$FILE"

echo "4. Run installation script"
DIR=$(ls "$TMPDIR")
sudo sh -c "./$DIR/install"

echo "5. Temporary directory cleanup"
cd "$PWD"
rm -drf "$TMPDIR"

echo ""
echo "hub successfully installed!"
echo $(/usr/local/bin/hub --version)
echo "-------------------------------------------"
echo "Run \`source ~/.profile\` to reload binaries."

exit 0
