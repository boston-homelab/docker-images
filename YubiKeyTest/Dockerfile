FROM ubuntu:jammy

LABEL maintainer="Steve Chin <schin8@bu.edu>"

USER root

RUN apt-get update\
    && apt-get install -y sudo curl git-core gnupg zsh wget nano jq zsh\
    && apt-get -y install software-properties-common

# install yubikey-tools
RUN apt-add-repository ppa:yubico/stable \
    && apt-get update \
    && apt-get install -y yubikey-manager \
    && apt-get install -y man 

RUN rm -rf /var/lib/apt/lists/* \
    && mkdir -p /setup     

COPY entrypoint.sh /setup
WORKDIR /root
ENTRYPOINT [ "/setup/entrypoint.sh"]
