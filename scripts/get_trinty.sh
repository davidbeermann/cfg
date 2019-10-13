echo "Install Trinity Wallet"
echo "More info: https://trinity.iota.org/"
echo "------------------------------------"

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
# This download is pinned to release tag desktop-1.1.0
# https://github.com/iotaledger/trinity-wallet/releases/tag/desktop-1.1.0
URL=$(wget -O- -q --show-progress --progress=bar:force:noscroll \
  https://api.github.com/repos/iotaledger/trinity-wallet/releases/assets/15022037 \
  | grep '"browser_download_url": ".*.AppImage"' \
  | sed -E 's/.*"([^"]+)".*/\1/')

PWD=$(pwd)
TMPDIR=$(mktemp -dt)
echo "2. Downloading to $TMPDIR"
cd "$TMPDIR"
# https://stackoverflow.com/a/29457649
wget -q --show-progress --progress=bar:force:noscroll "$URL"

FILE=$(ls "$TMPDIR")

echo "3. Installing release $FILE"
mkdir -p ~/AppImages
cp "$TMPDIR/$FILE" ~/AppImages/trinity-desktop.AppImage
chmod +x ~/AppImages/trinity-desktop.AppImage

echo "4. Temporary directory cleanup"
cd "$PWD"
rm -drf "$TMPDIR"

echo ""
echo "Trinity Wallet successfully installed!"
echo ""

exit 0

