FROM ubuntu:14.04
MAINTAINER Mick Pollard <aussielunix@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update
RUN apt-get install -y ruby ruby-dev git
RUN gem install fpm-cookery
