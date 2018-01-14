#!/bin/bash
set -e

echo "starting core..."

exec stellar-core --conf $CORE_CONFIG
