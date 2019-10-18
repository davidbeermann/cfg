#!/usr/bin/env bash

# Load helper functions
# https://stackoverflow.com/a/242550
BASEDIR=$(dirname "$0")
. "$BASEDIR/.functions.sh"

echo "Install Arduino"
echo "More info: https://www.arduino.cc/"
echo "----------------------------------"

# Create temporary directory
TMPDIR=$(mktemp -dt)
cd "$TMPDIR"

echo "1. Download latest release to $TMPDIR"
# https://www.arduino.cc/en/Main/Software
LATEST_RELEASE_URL="https://downloads.arduino.cc/arduino-1.8.10-linux64.tar.xz"
fetch_file "$LATEST_RELEASE_URL"

FILE=$(ls "$TMPDIR")

echo "2. Unpacking archive $FILE"
tar xf "$FILE"

rm "$FILE"
DIR=$(ls "$TMPDIR")
OPTDIR="/opt/arduino"

echo "3. Move binary folder to $OPTDIR"
sudo cp -rf "$DIR" "$OPTDIR"

echo "4. Run installation script"
# Ensure that the installation script runs through wo/ error
SYMLINK="/usr/local/bin/arduino"
if [ -L "$SYMLINK" ]; then
  sudo rm "$SYMLINK"
fi
cd "$OPTDIR"
sudo sh -c "./install.sh"

echo "5. Temporary directory cleanup"
rm -drf "$TMPDIR"

echo ""
echo "Arduino successfully installed!"

exit 0