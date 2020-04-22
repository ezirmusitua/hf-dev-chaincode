#!/usr/bin/bash

BIN_VERSION="$1"
CA_VERSION="$2"
: ${BIN_VERSION:="1.4.6"}
: ${CA_VERSION:="1.4.6"}


BIN_URL="https://github.com/hyperledger/fabric/releases/download/v${BIN_VERSION}/hyperledger-fabric-darwin-amd64-${BIN_VERSION}.tar.gz"
CA_URL="https://github.com/hyperledger/fabric-ca/releases/download/v${CA_VERSION}/hyperledger-fabric-ca-darwin-amd64-${CA_VERSION}.tar.gz"

if [[ "$(uname -a)" == *"Linux"* ]];then
  BIN_URL="https://github.com/hyperledger/fabric/releases/download/v${BIN_VERSION}/hyperledger-fabric-linux-amd64-${BIN_VERSION}.tar.gz"
  CA_URL="https://github.com/hyperledger/fabric-ca/releases/download/v${CA_VERSION}/hyperledger-fabric-ca-linux-amd64-${CA_VERSION}.tar.gz"
fi


echo "Download fabric binaries ..."
curl $BIN_URL -Lo fabric.tar.gz
tar xzf fabric.tar.gz
rm fabric.tar.gz


echo "Download ca binaries ..."
curl $CA_URL -Lo ca.tar.gz
tar xzf ca.tar.gz
rm ca.tar.gz

sudo chmod +x **

cp ./bin/orderer hfDevOrderer
cp ./bin/peer hfDevPeer

