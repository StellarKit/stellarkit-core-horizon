#!/bin/bash

if [ $BUILD_FROM_SRC -gt 0 ]
then
  # deploy stellar-core binary
  RUN mkdir -p /go/src/github.com/stellar/ \
    && git clone --depth 1 --branch master https://github.com/stellar/stellar-core /stellar-core \
    && cd /stellar-core \
    && git submodule init \
    && git submodule update \
    && ./autogen.sh \
    && ./configure \
    && make -j \
    && make install
else
  wget -O stellar-core.deb https://s3.amazonaws.com/stellar.org/releases/stellar-core/stellar-core-${STELLAR_CORE_VERSION}_amd64.deb
  dpkg -i stellar-core.deb
  rm stellar-core.deb

  echo "\nDone installing stellar-core...\n"
fi
