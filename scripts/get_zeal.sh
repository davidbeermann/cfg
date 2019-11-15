echo "Install Zeal"
echo "More info: https://zealdocs.org/"
echo "--------------------------------"

echo "1. Adding Debian package repository"
# https://zealdocs.org/download.html#linux
# https://launchpad.net/~zeal-developers/+archive/ubuntu/ppa
sudo add-apt-repository ppa:zeal-developers/ppa

echo "2. Installing Zeal"
sudo apt update --quiet && sudo apt install --yes zeal

exit 0
