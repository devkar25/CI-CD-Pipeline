#!/bin/sh/
sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository ppa:saltstack/salt
sudo apt-get update
sudo apt-get install salt-master
sudo service salt-master restart
