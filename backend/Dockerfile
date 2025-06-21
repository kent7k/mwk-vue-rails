FROM ruby:2.7.8-alpine AS base

ARG BUNDLER_VERSION=2.4.22
ENV LANG=C.UTF-8 TZ=Asia/Tokyo

# 必要パッケージを一括で入れる
RUN apk add --no-cache \
      build-base curl-dev linux-headers \
      bash curl git make gcc libc-dev \
      libxml2-dev nodejs yarn tzdata \
      mysql-dev mariadb-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v ${BUNDLER_VERSION} && \
    bundle _${BUNDLER_VERSION}_ config set --local force_ruby_platform true && \
    bundle _${BUNDLER_VERSION}_ install --jobs 4 --retry 3

COPY . .

EXPOSE 3001
CMD ["rails","server","-b","0.0.0.0","-p","3001"]
