#!/bin/bash
set -e

echo "starting core..."

exec stellar-core run --conf $CORE_CONFIG
