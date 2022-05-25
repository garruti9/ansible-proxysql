#!/bin/bash
apt-get update
apt-get install git
pip install --upgrade pip
pip3 install ansible
mkdir -p /etc/ansible/
mkdir -p /usr/local/etc/ansible/
