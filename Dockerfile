FROM python:3.10-alpine

# Avoid "WARNING: Running pip as the 'root' user...". See https://stackoverflow.com/questions/68673221/warning-running-pip-as-the-root-user
ENV PIP_ROOT_USER_ACTION=ignore

RUN apk update && apk upgrade
RUN pip install --upgrade pip
