#!/usr/bin/bash

CC_NAME=$1
CC_VER=$2
CC_PATH=$3
CC_LANG=$4

export FABRIC_CFG_PATH=$PWD/sampleconfig
./bin/peer chaincode install -n $CC_NAME -v $CC_VER -p $CC_PATH -l $CC_LANG
./bin/peer chaincode instantiate -n $CC_NAME -v $CC_VER -c '{"Args":[]}' -o 127.0.0.1:7050 -C ch1
