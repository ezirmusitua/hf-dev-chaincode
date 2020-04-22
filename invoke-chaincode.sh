#!/usr/bin/bash

CC_NAME=$1
CC_FN=$2
CC_ARGS=$3

export FABRIC_CFG_PATH=$PWD/sampleconfig
./bin/peer chaincode invoke -n $CC_NAME -c '{"Args":["'$CC_FN'",'$CC_ARGS']}' -o 127.0.0.1:7050 -C ch1
