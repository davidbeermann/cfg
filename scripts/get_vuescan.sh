#!/usr/bin/env bash

# Load helper functions
# https://stackoverflow.com/a/242550
BASEDIR=$(dirname "$0")
. "$BASEDIR/.functions.sh"

echo "Install VueScan"
echo "More info: https://www.hamrick.com/"
echo "-----------------------------------"

# Create temporary directory
TMPDIR=$(mktemp -dt)
cd "$TMPDIR"

echo "1. Download latest release to $TMPDIR"
# https://www.hamrick.com/download.html – Current version 9.7.xx
LATEST_RELEASE_URL="https://www.hamrick.com/files/vuex6497.tgz"
fetch_file "$LATEST_RELEASE_URL"

FILE=$(ls "$TMPDIR")

echo "2. Unpacking archive $FILE"
tar xzf "$FILE"

rm "$FILE"
DIR=$(ls "$TMPDIR")
INSTALL_DIR=/opt/VueScan

echo "3. Move binary folder to $INSTALL_DIR"
# Remove prior install first
if [ -d "$INSTALL_DIR" ]; then
  sudo rm -drf "$INSTALL_DIR"
fi
sudo cp -rf "$DIR" "$INSTALL_DIR"

ICON="/usr/share/pixmaps/vuescan.svg"
echo "4. Create icon file $ICON"
sudo cp -f "$INSTALL_DIR/vuescan.svg" "$ICON"

# https://askubuntu.com/a/282187
# https://stackoverflow.com/a/7875614
DESKTOP_FILE="/usr/share/applications/vuescan.desktop"
echo "5. Create Desktop file $DESKTOP_FILE"
sudo sh -c "cat >\"$DESKTOP_FILE\" <<EOL
[Desktop Entry]
Version=1.0
Name=VueScan
Comment=VueScan is an application for scanning documents, photos, film, and slides.
Exec=$INSTALL_DIR/vuescan
Path=$INSTALL_DIR/
Icon=$ICON
Terminal=false
Type=Application
Categories=Utility;
EOL"

echo "5. Temporary directory cleanup"
rm -drf "$TMPDIR"

echo ""
echo "VueScan successfully installed!"

exit 0
