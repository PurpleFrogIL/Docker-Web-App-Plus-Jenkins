FROM node:12-alpine
WORKDIR /app
COPY ./app .
RUN yarn install --production
# RUN rm package.json; rm yarn.lock
CMD ["node", "/app/src/index.js"]
