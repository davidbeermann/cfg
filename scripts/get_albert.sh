echo "Install Albert"
echo "More info: https://albertlauncher.github.io/"
echo "--------------------------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed.' >&2
  exit 1
fi

echo "1. Adding Debian package repository"
# https://albertlauncher.github.io/docs/installing/
# https://software.opensuse.org/download.html?project=home:manuelschneid3r&package=albert
curl -sS https://build.opensuse.org/projects/home:manuelschneid3r/public_key \
  | sudo apt-key add -
echo "deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_19.04/ /" \
  | sudo tee /etc/apt/sources.list.d/albert.list
#curl -sS https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_19.04/Release.key \
#  | sudo apt-key add -

echo "2. Installing Albert"
sudo apt update --quiet && sudo apt install --no-install-recommends --yes albert

exit 0
