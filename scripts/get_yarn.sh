echo "Install Yarn"
echo "More info: https://yarnpkg.com/"
echo "-------------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

echo "1. Adding Debian package repository"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "2. Installing Yarn"
sudo apt update --quiet && sudo apt install --no-install-recommends --yes yarn

exit 0
