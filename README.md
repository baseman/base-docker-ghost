Note: this is still a work in progress

I created this guide because I wanted to have a docker container on Ubuntu that ran a NodeJS Ghost blog engine.

# Getting Started
You will need…
- VirtualBox - https://www.virtualbox.org/
- Vagrant - http://www.vagrantup.com/
- base-vagrant-docker-node - https://github.com/baseman/base-vagrant-docker-node

For Windows - you will also need
- ssh client (eg. Putty - http://www.chiark.greenend.org.uk/~sgtatham/putty/)

## Configure Vagrant Environment and Create NodeJS Docker Image
1. Follow ALL setup instructions for base-vagrant-docker-node (https://github.com/baseman/base-vagrant-docker-node)

## Create Ghost Docker Container

1. Replace Docker file from base-vagrant-docker-node repository with docker file from base-docker-ghost repository

2. Run the following commands in your terminal window

    git clone https://github.com/TryGhost/Ghost.git
    vagrant up
    vagrant ssh
    cd /vagrant
    sudo docker build -t <your-name>/ghost .

## Running a docker container

    sudo docker run -d -p 8080:8080 baseman/ghost

### Other Docker Commands

- Bind data volumes to a running instance of docker

    sudo docker run -v /vagrant/Ghost/content/images -v /vagrant/Ghost/content/data -name ghost-data baseman/node /bin/sh

    sudo docker run -d -i -t -p 8080:8080 -volumes-from ghost-data <your-name>/node /bin/bash
