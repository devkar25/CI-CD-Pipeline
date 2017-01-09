#!/bin/sh/
sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository ppa:saltstack/salt
sudo apt-get update
sudo apt-get install salt-minion

sudo service salt-minion restart