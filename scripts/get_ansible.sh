#!/bin/bash

# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-18-04
#sudo apt-add-repository ppa:ansible/ansible
#sudo apt update
#sudo apt install -y ansible

# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-20-04
#sudo apt update
#sudo apt install software-properties-common
#sudo apt-add-repository --yes --update ppa:ansible/ansible
#sudo apt install ansible
# This did not work because the dependency python-paramiko could not be installed
# Before the error showed up, I had to downgrade the apt repository for eoan (19.10)
# https://launchpad.net/~ansible/+archive/ubuntu/ansible

sudo ln -s -f $(which python3) /usr/bin/python

# https://pip.pypa.io/en/stable/installing/
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py

# https://stackoverflow.com/a/37426061
pip install paramiko ansible

