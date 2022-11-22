FROM node:12-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
# To prevent error "nodemon: not found" (e.g. yarn run dev --> nodemon src/index.js)
RUN yarn add nodemon
# RUN rm package.json; rm yarn.lock
CMD ["node", "/app/src/index.js"]
