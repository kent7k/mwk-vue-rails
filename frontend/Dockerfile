FROM node:16.14.0-alpine3.14

WORKDIR /app

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile

COPY . /app

RUN yarn run build

EXPOSE 3000

CMD ["yarn", "start"]
