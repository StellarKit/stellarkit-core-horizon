#!/bin/bash

set -e

echo "starting horizon..."

source $HORIZ_ENV
exec horizon
