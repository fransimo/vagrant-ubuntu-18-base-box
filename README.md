# vagrant-ubuntu-18-base-box

This is a step by step guide to create a vagrant base image for Ubuntu Desktop 18 for VirtualBox.
It's the first step to update our development environment https://github.com/fransimo/vagrant-qa-automation-development-environment.

If you only want the image use [this](ready-to-use/README.md) 

# step-by-step
1. Download the daily ubuntu image
- http://cdimage.ubuntu.com/daily-live/current/HEADER.html

1. Run the minimal Ubuntu installation
- Virtual machine name is ubuntu-desktop-18 
- for this box I use 4G RAM and 60G dynamic disk
- 
- you can check the sequence in ...
- Important
	user and password must be: vagrant

1. Virtual machine tunning for vagarnt automation
- install virtual box tools
  - sudo apt-get install gcc make perl

- insert guest addition disk

- install virtual box vagrant dependencies
  - sudo apt-get install linux-headers-$(uname -r) build-essential dkms

- make vagrant user password less sudoer
  - create a file /etc/sudoers.d/vagrant with this content

vagrant ALL=(ALL) NOPASSWD: ALL

- add ssh support and make it vagrant complaint
  - sudo apt-get install ssh
  - wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant
  - wget https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
  - ssh-copy-id -i vagrant vagrant@localhost
  - chmod 600 vagrant vagrant.pub 
  - ssh -i vagrant vagrant@localhost
  - rm vagrant vagrant.pub 

1. Create the box
- Choose a directory for creating and testing the box
- vagrant package --base ubuntu-desktop-18 

1. Test the image
- vagrant init u18 /Users/fran/Documents/workspace/vagrant-ubuntu-18-base-box/package.box
- modify Vagrantfile and activate the gui
- vagrant up

1. Test cycle if your tuning
- rm package.box
- vagrant package --base ubuntu-desktop-18 
- vagrant box remove u18
- vagrant destroy
- rm Vagrantfile
- vagrant init u18 package.box
- modify Vagrantfile and activate the gui
- vagrant up

1. Automated
- This steps are automated in vagrant-init/init.sh

References
https://www.vagrantup.com/docs/boxes/base.html
https://www.vagrantup.com/docs/virtualbox/boxes.html