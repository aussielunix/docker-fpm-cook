FROM ubuntu:14.04.1
MAINTAINER Mick Pollard <aussielunix@gmail.com>

VOLUME ["/data/","/pkg/"]
WORKDIR /data

RUN echo 'gem: --no-document --no-ri' > /usr/local/etc/gemrc

ENV RUBY_MAJOR_VERSION 2.0
ENV RUBY_VERSION 2.0.0-p598
ENV RUBY_TARBALL_MD5 e043a21ce0d138fd408518a80aa31bba

RUN apt-get update && \
      apt-get -y install \
      build-essential \
      git \
      wget \
      curl \
      unzip \
      ca-certificates \
      libffi-dev \
      libreadline6-dev \
      libssl-dev \
      libyaml-dev \
      ssh \
      zlib1g-dev && \
      curl -s -O http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR_VERSION/ruby-$RUBY_VERSION.tar.gz && \
      [ $(md5sum ruby-$RUBY_VERSION.tar.gz | awk '{ print $1 }') = $RUBY_TARBALL_MD5 ] && \
      tar -zxf ruby-$RUBY_VERSION.tar.gz && \
      cd ruby-$RUBY_VERSION && \
      ./configure --disable-install-doc && \
      make -j$(nproc) && \
      make install && \
      cd .. && \
      rm -rf ruby-$RUBY_VERSION ruby-$RUBY_VERSION.tar.bz2 /tmp/* /var/tmp/* && \
      apt-get -y clean autoclean autoremove && \
      rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN gem install fpm-cookery -v 0.24.0 && gem install package_cloud
CMD ["fpm-cook", "package", "--pkg-dir=/pkg/", "-t deb", "-p ubuntu", "recipe.rb"]
