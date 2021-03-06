#!/bin/bash

mkdir /root/.ssh-keygen

ssh-keygen -f /root/.ssh/id_rsa -P ""
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/id_rsa

yum -y install vim-enhanced wget git epel-release

yum -y update
yum -y install ansible

#ansible-galaxy install mongrelion.docker

export ANSIBLE_HOST_KEY_CHECKING=false

git clone https://github.com/norrebronx/mainServer.git

cd mainServer/ansible

ansible-playbook -i hosts sites.yml	--vault-password-file ../secret.txt
