FROM ruby:2.7.1-alpine3.11

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev bash curl git make gcc libc-dev nodejs tzdata mysql-dev mariadb-client yarn" \
    DEV_PACKAGES="build-base curl-dev" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache ${RUNTIME_PACKAGES} && \
    apk add --update --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    gem install bundler && \
    bundle install -j4 && \
    bundle config set force_ruby_platform true && \
    apk del build-dependencies && \
    rm -rf /usr/local/bundle/cache/* \
    /usr/local/share/.cache/* \
    /var/cache/* \
    /tmp/* \
    /usr/lib/mysqld* \
    /usr/bin/mysql*

ADD . /app
CMD ["rails", "server", "-b", "0.0.0.0", "RAILS_ENV=development"]

ARG ARG_COMPOSE_WAIT_VER=2.7.3
RUN curl -SL https://github.com/ufoscout/docker-compose-wait/releases/download/${ARG_COMPOSE_WAIT_VER}/wait -o /wait
RUN chmod +x /wait