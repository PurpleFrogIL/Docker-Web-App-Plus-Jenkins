FROM node:12-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
RUN rm package.json; rm yarn.lock
COPY ./src ./spec ./
CMD ["node", "/app/src/index.js"]
