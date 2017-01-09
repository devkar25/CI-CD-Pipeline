#!/bin/bash
apt-get update
apt-get install -y ansible
cp ansible/ansible.cfg /etc/ansible/ansible.cfg