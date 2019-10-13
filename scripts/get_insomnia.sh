echo "Install Insomnia"
echo "More info: https://insomnia.rest/"
echo "---------------------------------"

# https://stackoverflow.com/a/26759734
if ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget is not installed.' >&2
  exit 1
fi

# https://support.insomnia.rest/article/23-installation#linux
echo "1. Adding Debian package repository"
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
  | sudo apt-key add -
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
  | sudo tee /etc/apt/sources.list.d/insomnia.list

echo "2. Installing Insomnia"
sudo apt update --quiet && sudo apt install --yes insomnia

exit 0
