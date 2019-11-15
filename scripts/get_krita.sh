echo "Install Krita"
echo "More info: https://krita.org/en/"
echo "--------------------------------"

echo "1. Adding Debian package repository"
# https://launchpad.net/~kritalime/+archive/ubuntu/ppa
sudo add-apt-repository ppa:kritalime/ppa

echo "2. Installing Krita"
sudo apt update --quiet && sudo apt install --yes krita

exit 0
