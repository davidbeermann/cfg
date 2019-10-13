echo "Install jq"
echo "More info: https://stedolan.github.io/jq/"
echo "-----------------------------------------"

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
# https://github.com/stedolan/jq/releases
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
# https://stackoverflow.com/a/29457649
URL=$(wget -O- -q --show-progress --progress=bar:force:noscroll \
  https://api.github.com/repos/stedolan/jq/releases/latest \
  | grep '"browser_download_url": ".*linux64"' \
  | sed -E 's/.*"([^"]+)".*/\1/')

echo "2. Installing latest binary"
PWD=$(pwd)
sudo mkdir -p /usr/local/bin
cd /usr/local/bin
# https://stackoverflow.com/a/29457649
sudo wget -q --show-progress --progress=bar:force:noscroll -O jq "$URL"
sudo chmod +x jq
cd "$PWD"

VERSION=$(/usr/local/bin/jq --version)
echo ""
echo "jq ($VERSION) successfully installed!"
echo "-------------------------------------------"
echo "Run \`source ~/.profile\` to reload binaries."

exit 0
