#!/bin/bash

wget -O stellar-core.deb https://s3.amazonaws.com/stellar.org/releases/stellar-core/stellar-core-${STELLAR_CORE_VERSION}_amd64.deb
dpkg -i stellar-core.deb
rm stellar-core.deb

echo "\nDone installing stellar-core...\n"
