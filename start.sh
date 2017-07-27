#!/bin/bash

export CONNECTOR_PORT='8080'
export CONNECTOR_MAX_HOLD_TIME='1000'
export CONNECTOR_PEERS='test.west.server,test.east.server'
export CONNECTOR_BACKEND='one-to-one'
export CONNECTOR_FX_SPREAD='0'

export CONNECTOR_LEDGERS=$(cat <<EOF
{
  "test.west.": {
    "currency": "USD",
    "plugin": "ilp-plugin-payment-channel-framework",
    "options": {
      "prefix": "test.west.",
      "token": "placeholder",
      "rpcUri": "http://ilp-kit1:3010/api/peers/rpc"
    }
  },
  "test.east.": {
    "currency": "USD",
    "plugin": "ilp-plugin-payment-channel-framework",
    "options": {
      "prefix": "test.east.",
      "token": "placeholder",
      "rpcUri": "http://ilp-kit2:4010/api/peers/rpc"
    }
  }
}
EOF
)

node index.js
