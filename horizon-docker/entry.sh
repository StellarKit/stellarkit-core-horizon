#!/bin/bash

set -e

export STELLAR_HOME="/opt/stellar"

export HORIZ_ENV="$STELLAR_HOME/horizon.env"
if [ $TESTNET -gt 0 ]
then
  export HORIZ_ENV="$STELLAR_HOME/horizon-testnet.env"
fi

function main() {
  echo ""
  echo "Starting Horizon"
  echo ""

  build-config /configs/.pgpass > /root/.pgpass
  chmod 600 /root/.pgpass

  while ! psql -h stellarpostgres -U $POSTGRES_USER -c 'select 1' horizondb &> /dev/null
  do
    echo "Waiting for horizondb to be available..."
    sleep 1
  done

  build-config /configs/horizon.env > $STELLAR_HOME/horizon.env
  build-config /configs/horizon-testnet.env > $STELLAR_HOME/horizon-testnet.env

  if [ $INSTALL_SSL_CERTS -gt 0 ]
  then
    # put a folder tls in your home directory with server.crt and server.key
    cp -r ${STELLAR_HOME}/../tls/ ${STELLAR_HOME}/tls/
  fi

  init_horizon

  /launch.sh
}

function init_horizon() {
  if [ -f $STELLAR_HOME/.horizon-initialized ]
  then
    echo "horizon: already initialized"
    return 0
  fi

  source $HORIZ_ENV
  horizon db init

  touch $STELLAR_HOME/.horizon-initialized
}

main
