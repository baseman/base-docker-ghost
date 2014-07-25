Note: this is still a work in progress

I created this guide because I wanted to have a docker container on Ubuntu that ran a NodeJS Ghost blog engine.

# Getting Started
### For Linux you will need...
- Docker

### For Win / OSX You will need…
- base-vagrant-docker-node - https://github.com/baseman/base-vagrant-docker-node
  - Follow ALL setup instructions for base-vagrant-docker-node (https://github.com/baseman/base-vagrant-docker-node)

Once base-vagrant-docker-node docker image is configured replace Docker file from base-vagrant-docker-node repository with docker file from base-docker-ghost repository

## Create Ghost Docker Container

2. Run the following commands in your terminal window

    git clone https://github.com/TryGhost/Ghost.git
    vagrant up
    vagrant ssh
    cd /vagrant
    sudo docker build -t <your-name>/ghost .

## Running a docker container

    sudo docker run -d -p <host_port>:2368 baseman/ghost

## Other Docker Commands

#### Bind data volumes to a running instance of docker

    sudo docker run [-v <Mountable Volumes>] baseman/ghost-dev npm start

Mountable Volumes:

    -v %GHOST-DEV-PATH%/content/apps:/ghost/content/apps

    -v %GHOST-DEV-PATH%/content/themes:/ghost/content/themes

    -v %GHOST-DEV-PATH%/core/client:/ghost/core/client

    -v %GHOST-DEV-PATH%/core/shared:/ghost/core/shared

Eg.

    sudo docker run -d -p 80:2368 -v %GHOST-DEV-PATH%/content/apps:/ghost/content/apps -v %GHOST-DEV-PATH%/content/themes:/ghost/content/themes -v %GHOST-DEV-PATH%/core/client:/ghost/core/client -v %GHOST-DEV-PATH%/core/shared:/ghost/core/shared baseman/ghost-dev npm start