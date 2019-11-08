#!/usr/bin/env bash

# Load helper functions
# https://stackoverflow.com/a/242550
BASEDIR=$(dirname "$0")
. "$BASEDIR/.functions.sh"

echo "Install Skype"
echo "More info:https://www.skype.com/en/"
echo "-----------------------------------"
DEB_URL="https://go.skype.com/skypeforlinux-64.deb"
DEB_FILE="skype.deb"

TMPDIR=$(mktemp -dt)
echo "1. Download package to $TMPDIR"
cd "$TMPDIR"
fetch_file -O "$DEB_FILE" "$DEB_URL"

echo "2. Installing release $DEB_FILE"
install_deb "$TMPDIR/$DEB_FILE"

echo "3. Temporary directory cleanup"
rm -drf "$TMPDIR"

echo ""
echo "$FILE successfully installed!"
echo ""

exit 0
