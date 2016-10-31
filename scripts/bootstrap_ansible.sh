#!/bin/bash

set -e

echo "Installing Repository..."
apt-get install -y software-properties-common
apt-add-repository ppa:ansible/ansible

echo "Installing Git..."
apt-get install -y git

echo "Installing Ansible..."
apt-get install -y   ansible

echo "Updating Ubuntu ..."
apt-get update -y


echo "Copying Ansible Configuration..."
cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg

echo "Script  Endbootstrap_ansible.sh..."
 
