# DOCKER-VERSION 0.7.0

FROM baseman/node

ADD ./ghost /ghost
RUN sed -i -e 's/127.0.0.1/0.0.0.0/g' ghost/config.example.js

WORKDIR /ghost

RUN npm install --production
RUN npm install sqlite3 --build-from-source

CMD ["npm", "start"]