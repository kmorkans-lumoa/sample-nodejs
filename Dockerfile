FROM returntocorp/semgrep as test

COPY . .

RUN semgrep --config "p/nodejsscan" --error


FROM node:16-alpine3.16 as build

RUN apk add --no-cache dumb-init

ENV NODE_ENV production

WORKDIR /usr/src/app

COPY --chown=node:node . /usr/src/app

RUN npm ci --only=production

USER node

CMD ["dumb-init", "node", "./bin/www"]
