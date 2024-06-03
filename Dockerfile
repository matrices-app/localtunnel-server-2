FROM node:10.1.0-alpine

WORKDIR /app

COPY package.json /app/

RUN yarn install --production && yarn cache clean

COPY . /app

ENV NODE_ENV production
ENV DEBUG *
ENTRYPOINT ["node", "-r", "esm", "./bin/server", "--secure", "--port", "10000"]
