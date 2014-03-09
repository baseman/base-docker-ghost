# DOCKER-VERSION 0.7.0

FROM baseman/node

# Install Ghost
RUN apt-get install wget
RUN apt-get install -y unzip

WORKDIR /tmp
RUN wget https://ghost.org/archives/ghost-0.4.0.zip
RUN mkdir /ghost

WORKDIR /ghost
RUN unzip -uo /tmp/ghost-0.4.0.zip -d /ghost

# To manually build Ghost, uncomment this instead
# sudo apt-get install git
# git clone https://github.com/tryghost/Ghost
# RUN npm install --production
# RUN npm install sqlite3 --build-from-source

# Install Ghost
ADD ./config.example.js /ghost/config.example.js
RUN sed -i -e 's/127.0.0.1/0.0.0.0/g' /ghost/config.example.js

RUN npm install --production

# CMD ["npm", "start"]
