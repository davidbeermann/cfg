echo "Install Signal messenger"
echo "More info: https://signal.org/"
echo "------------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

echo "1. Adding Debian package repository"
# https://signal.org/download/
curl -s https://updates.signal.org/desktop/apt/keys.asc \
  | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" \
  | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

echo "2. Installing desktop app"
sudo apt update && sudo apt install --yes signal-desktop

exit 0
