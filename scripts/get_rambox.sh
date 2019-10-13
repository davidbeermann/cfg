echo "Install Rambox"
echo "More info: https://rambox.pro/"
echo "------------------------------"

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
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
# https://stackoverflow.com/a/29457649
URL=$(wget -O- -q --show-progress --progress=bar:force:noscroll \
  https://api.github.com/repos/ramboxapp/community-edition/releases/latest \
  | grep '"browser_download_url": ".*amd64.deb"' \
  | sed -E 's/.*"([^"]+)".*/\1/')

PWD=$(pwd)
TMPDIR=$(mktemp -dt)
echo "2. Downloading to $TMPDIR"
cd "$TMPDIR"
# https://stackoverflow.com/a/29457649
wget -q --show-progress --progress=bar:force:noscroll "$URL"

FILE=$(ls "$TMPDIR")

echo "3. Installing release $FILE"
# https://askubuntu.com/a/795048
# https://manpages.debian.org/buster/apt/apt-get.8.en.html
sudo apt --quiet --assume-yes --fix-broken install "$TMPDIR/$FILE"

echo "4. Temporary directory cleanup"
cd "$PWD"
rm -drf "$TMPDIR"

echo ""
echo "$FILE successfully installed!"
echo ""

exit 0

