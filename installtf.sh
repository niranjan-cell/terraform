#!/bin/bash
apt update 
apt install  software-properties-common gnupg2 curl -y
curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/
echo | apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com focal main" 
apt update
apt install terraform