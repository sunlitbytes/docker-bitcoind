#!/bin/bash

set -euo pipefail

BITCOIN_CONF=/root/.bitcoin/bitcoin.conf

if [ ! -e "${BITCOIN_CONF}" ]; then
  mv /usr/local/bin/bitcoin.conf ${BITCOIN_CONF}
fi

if [ $# -eq 0 ]; then
  exec bitcoind
else
  exec "$@"
fi