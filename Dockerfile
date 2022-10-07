FROM python:3.10-alpine

RUN apk update && apk upgrade
RUN pip install --upgrade pip
