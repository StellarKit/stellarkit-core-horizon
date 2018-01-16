#!/bin/sh

if [ $BUILD_FROM_SRC -gt 0 ]
then
  # deploy horizon binary
  mkdir -p /go/src/github.com/stellar/ \
    && git clone --depth 1 --branch master https://github.com/stellar/go.git /go/src/github.com/stellar/go \
    && cd /go/src/github.com/stellar/go \
    && curl https://glide.sh/get | sh \
    && glide install \
    && go install github.com/stellar/go/services/horizon

  mv /go/bin/horizon /usr/local/bin
else
  wget -O horizon.tar.gz https://github.com/stellar/horizon/releases/download/v${HORIZON_VERSION}/horizon-v${HORIZON_VERSION}-linux-amd64.tar.gz
  tar -zxvf horizon.tar.gz
  mv ./horizon-v${HORIZON_VERSION}-linux-amd64/horizon /usr/local/bin
  chmod +x /usr/local/bin/horizon

  echo "\nDone installing stellar-core...\n"
fi
