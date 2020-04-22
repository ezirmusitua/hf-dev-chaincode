#!/usr/bin/bash

pkill hfDevOrderer
pkill hfDevPeer

if [ -d /tmp/hyperledger/ ]; then
  rm -rf /tmp/hyperledger
fi

if [ -d channel-artifacts ]; then
  rm -rf channel-artifacts
fi

