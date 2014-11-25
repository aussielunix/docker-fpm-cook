FROM stackbrew/ubuntu:trusty
MAINTAINER Mick Pollard <aussielunix@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

#ENV LC_ALL en_US.UTF-8
#ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    ruby \
    libssl-dev \
    libreadline-dev \
    libxslt1-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libexpat1-dev \
    libicu-dev

RUN LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8" gem install fpm-cookery
