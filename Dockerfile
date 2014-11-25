FROM ubuntu:14.04
MAINTAINER Mick Pollard <aussielunix@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV LC_ALL en_AU.UTF-8

RUN locale-gen en_AU.UTF-8
RUN update-locale LANG=en_AU.UTF-8


RUN apt-get update
RUN apt-get install -y ruby2.0 ruby2.0-dev git build-essential
RUN gem install fpm-cookery
