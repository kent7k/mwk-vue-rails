FROM node:16.13.1-alpine

WORKDIR /app

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

ADD package.json /app/package.json
ADD yarn.lock /app/yarn.lock

RUN apk update && \
    yarn global add create-nuxt-app

#RUN apt-get update -y && \
#  apt-get upgrade -y && \
#  npm install -g npm@6.14.4 && \
#  npm install -g ejs@3.0.1 &&\
#  npm install -g nuxt@2.0.0 &&\
#  npm install -g create-nuxt-app@2.15.0 &&\
#  npm install -g defu@3.1.0

ADD . /app

RUN yarn run build

EXPOSE 3000

CMD ["yarn", "run", "start"]
