#!/bin/bash
set -e

while ! psql -h stellarpostgres -U stellar -c 'select 1' coredb &> /dev/null ; do
  echo "Waiting for coredb to be available..."
  sleep 1
done

echo "starting core..."

exec stellar-core --conf $CORE_CONFIG
