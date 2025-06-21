FROM node:20-alpine3.19 AS deps

WORKDIR /app
COPY package.json yarn.lock ./
RUN --mount=type=cache,target=/root/.cache/yarn \
    yarn install --frozen-lockfile

# ─────────────────────────────────────────
FROM node:20-alpine3.19 AS runner
ARG WORKDIR
ARG CONTAINER_PORT
ARG API_URL
ENV NODE_OPTIONS="--openssl-legacy-provider" \
    HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0 \
    API_URL=${API_URL}

WORKDIR ${HOME}
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN yarn build

EXPOSE ${CONTAINER_PORT}
CMD ["yarn", "start"]
