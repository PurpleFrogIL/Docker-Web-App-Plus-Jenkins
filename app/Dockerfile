FROM node:12-alpine

WORKDIR /app
COPY . .
RUN yarn install --production
RUN rm package.json yarn.lock

ARG VERSION=null
RUN echo "${VERSION}" > version.txt
RUN sed -i "s/APP_VERSION/${VERSION}/" /app/src/static/js/app.js

CMD ["node", "/app/src/index.js"]
