#!/bin/bash

set -e

while ! psql -h stellarpostgres -U stellar -c 'select 1' horizondb &> /dev/null
do
  echo "Waiting for horizondb to be available..."
  sleep 1
done

echo "starting horizon..."

source $HORIZ_ENV
exec horizon
