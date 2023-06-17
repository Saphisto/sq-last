#!/bin/bash


if [ $(id -u) -ne 0 ]
  then echo "Please run as root"
  exit 1

fi
echo "Installing Ansible, stand by."

sudo apt-add-repository ppa:ansible/ansible

sudo apt update

sudo apt install ansible -y

