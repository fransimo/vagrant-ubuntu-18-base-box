#!/bin/bash

# VBox additions
sudo apt-get -y install gcc make perl

# VBox 
sudo apt-get -y install linux-headers-$(uname -r) build-essential dkms

# Password less sudo
sudo cp vagrant.sudoer /etc/sudoers.d/vagrant

# ssh
sudo apt-get -y install ssh
wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant
wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
ssh-copy-id -i vagrant vagrant@localhost
chmod 600 vagrant vagrant.pub 
ssh -i vagrant vagrant@localhost
rm vagrant vagrant.pub 


