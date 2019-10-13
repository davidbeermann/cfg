echo "Install youtube-dl"
echo "More info: https://youtube-dl.org/"
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
# https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
# https://stackoverflow.com/a/29457649
URL=$(wget -O- -q --show-progress --progress=bar:force:noscroll \
  https://api.github.com/repos/ytdl-org/youtube-dl/releases/latest \
  | grep '"browser_download_url": ".*youtube-dl"' \
  | sed -E 's/.*"([^"]+)".*/\1/')

echo "2. Installing latest binary"
PWD=$(pwd)
sudo mkdir -p /usr/local/bin
cd /usr/local/bin
# https://stackoverflow.com/a/29457649
sudo wget -q --show-progress --progress=bar:force:noscroll -O youtube-dl "$URL"
sudo chmod +x youtube-dl
cd "$PWD"

VERSION=$(/usr/local/bin/youtube-dl --version)
echo ""
echo "youtube-dl ($VERSION) successfully installed!"
echo "-------------------------------------------"
echo "Run \`source ~/.profile\` to reload binaries."

exit 0
