FROM ruby:3.4.2-alpine3.20

ARG BUNDLER_VERSION=2.5.9
ARG WORKDIR=/workspace
ARG API_CONTAINER_PORT=3001

#---------------- 共通環境変数 ----------------#
ENV LANG=C.UTF-8 TZ=Asia/Tokyo \
    WORKDIR=${WORKDIR} \
    API_CONTAINER_PORT=${API_CONTAINER_PORT}

# --- OS パッケージ ---
RUN apk add --no-cache \
      build-base \
      linux-headers \
      bash \
      git \
      curl \
      make \
      gcc \
      libc-dev \
      libxml2-dev \
      nodejs \
      yarn \
      tzdata \
      mysql-client \
      mysql-dev

# 作業ディレクトリ設定は RUN 命令のあとに別で
WORKDIR ${WORKDIR}

RUN gem install bundler -v ${BUNDLER_VERSION}

# --- Ruby gems ---
COPY Gemfile Gemfile.lock ./
RUN --mount=type=cache,target=/usr/local/bundle/cache \
    bundle _${BUNDLER_VERSION}_ config set --local force_ruby_platform true && \
    bundle _${BUNDLER_VERSION}_ install -j$(nproc)

# --- アプリ本体 ---
COPY . .

#---------------- ネットワーク設定 ----------------#
EXPOSE ${API_CONTAINER_PORT}

#---------------- 起動コマンド ----------------#
# JSON 形式だと $API_CONTAINER_PORT が展開されないため、
# sh -c 経由で実行してシェル展開を使う
CMD ["sh", "-c", "bundle exec rails server -b 0.0.0.0 -p ${API_CONTAINER_PORT}"]
