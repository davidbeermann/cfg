echo "Install Nextcloud client"
echo "More info: https://nextcloud.com/install/#install-clients"
echo "---------------------------------------------------------"

# https://stackoverflow.com/a/26759734
# if ! [ -x "$(command -v curl)" ]; then
#   echo 'Error: curl is not installed.' >&2
#   exit 1
# fi

echo "1. Adding Debian package repository"
# https://launchpad.net/~nextcloud-devs/+archive/ubuntu/client
#echo "deb http://ppa.launchpad.net/nextcloud-devs/client/ubuntu disco main" \
#  | sudo tee /etc/apt/sources.list.d/nextcloud.list
sudo add-apt-repository ppa:nextcloud-devs/client

echo "2. Installing Nextcloud client"
sudo apt update --quiet && sudo apt install --no-install-recommends --yes nextcloud-client

exit 0
