echo "Install Docker"
echo "More info: lhttps://www.docker.com"
echo "----------------------------------"

echo "1. Install prerequisites"
sudo apt update -q && sudo apt install -q -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common


echo "2. Adding Debian package repository"
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-from-a-package
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

echo "3. Installing Docker"
sudo apt update -q && sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

exit 0
