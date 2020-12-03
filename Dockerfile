# Dockerfile to build Flaskex container images
# Based on Ubuntu 18.04

FROM ubuntu:18.04

LABEL maintainer="shlyapinsan@mail.ru"

ARG APP_USER=flskx
ARG APP_DIR=/opt/Flaskex

RUN useradd -m ${APP_USER} && \
    apt-get update -yq && \
    apt-get install -yq git && \ 
    apt-get install -yq python3-pip && \
    apt-get clean && \
    mkdir ${APP_DIR} && \
    chown -R ${APP_USER} ${APP_DIR}

USER ${APP_USER}

WORKDIR ${APP_DIR}
      
RUN git clone https://github.com/anfederico/Flaskex . && \
    pip3 install -r requirements.txt

CMD python3 app.py

EXPOSE 5000
