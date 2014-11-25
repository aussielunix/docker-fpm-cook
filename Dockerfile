FROM ubuntu:14.04
MAINTAINER Mick Pollard <aussielunix@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

#RUN locale-gen en_US.UTF-8
#RUN dpkg-reconfigure locales

RUN apt-get update
RUN apt-get install -y ruby1.9.3 git build-essential libtool automake pkg-config wget
RUN gem install fpm-cookery
