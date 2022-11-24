FROM node:12-alpine

WORKDIR /app
COPY . .
RUN yarn install --production
# To prevent error "nodemon: not found" (e.g. yarn run dev --> nodemon src/index.js)
# RUN yarn add nodemon
# RUN rm package.json; rm yarn.lock

ARG VERSION=null
RUN echo "${VERSION}" > version.txt
RUN sed -i "s/APP_VERSION/${VERSION}/" /app/src/static/js/app.js

CMD ["node", "/app/src/index.js"]
