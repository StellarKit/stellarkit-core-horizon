#!/bin/bash

apt-get update

if [ $BUILD_FROM_SRC -ne 0 ]
then
  apt-get install -y git curl mercurial

  # deploy horizon binary
  mkdir -p /go/src/github.com/stellar/ \
    && git clone --depth 1 --branch ${HORIZON_TAG} https://github.com/stellar/go.git /go/src/github.com/stellar/go \
    && cd /go/src/github.com/stellar/go \
    && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
    && dep ensure -v \
    && go install github.com/stellar/go/services/horizon

  mv /go/bin/horizon /usr/local/bin
else
  apt-get install -y wget

  wget -O horizon.tar.gz https://github.com/stellar/go/releases/download/horizon-v${HORIZON_VERSION}/horizon-v${HORIZON_VERSION}-linux-amd64.tar.gz
  tar -zxvf horizon.tar.gz
  mv ./horizon-v${HORIZON_VERSION}-linux-amd64/horizon /usr/local/bin
  chmod +x /usr/local/bin/horizon

  echo "\nDone installing stellar-horizon...\n"
fi
