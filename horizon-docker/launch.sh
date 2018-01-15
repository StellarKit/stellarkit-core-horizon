#!/bin/bash

set -e

echo "starting horizon..."

sleep 22222

source $HORIZ_ENV
exec horizon
