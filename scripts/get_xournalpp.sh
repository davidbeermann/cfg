#!/usr/bin/env bash

# Load helper functions
# https://stackoverflow.com/a/242550
BASEDIR=$(dirname "$0")
. "$BASEDIR/.functions.sh"

APP="Xournal++"

# The goal with this app was to sign PDFs
# https://unix.stackexchange.com/a/225245
# https://www.howtogeek.com/164668/how-to-electronically-sign-documents-without-printing-and-scanning-them/
# Resorted to install Foxit PDF Reader instead:
# https://www.foxitsoftware.com/pdf-reader/
echo "This script does not work due to a missing dependency :("
# https://github.com/xournalpp/xournalpp/issues/959
exit 0

echo "Install $APP"
echo "More info: https://github.com/xournalpp/xournalpp"
echo "-------------------------------------------------"

TMPDIR=$(mktemp -dt)

# https://github.com/xournalpp/xournalpp/releases
# https://askubuntu.com/a/445496
echo "2. Fetching latest release url from GitHub"
URL=$(fetch_github_download_url "xournalpp/xournalpp" ".*Ubuntu-xenial-x86_64.deb")
# URL=$(fetch_github_download_url "xournalpp/xournalpp" ".*Debian-buster-x86_64.deb")

# echo $URL
# exit 0

DEB_FILE="xournalpp.deb"

echo "3. Downloading latest release to $DEB_FILE"
fetch_file -O "$TMPDIR/$DEB_FILE" "$URL"

# echo "$TMPDIR/$DEB_FILE"
# exit 0

echo "4. Installing $DEB_FILE"
install_deb "$TMPDIR/$DEB_FILE"

echo "5. Temporary directory cleanup"
rm -drf "$TMPDIR"

echo ""
echo "$APP successfully installed!"
echo ""

exit 0
