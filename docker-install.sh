#!/bin/sh

arch=`dpkg --print-architecture`

sudo apt-get remove -y docker docker-engine docker.io containerd runc

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=${arch}] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


sudo apt-get update -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker ${USER}
