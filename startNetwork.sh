#/usr/bin/bash

. stopNetwork.sh

export FABRIC_CFG_PATH=$PWD/sampleconfig
sed -i 's/\/var/\/tmp/g' sampleconfig/core.yaml
sed -i 's/\/var/\/tmp/g' sampleconfig/orderer.yaml
export ORDERER_GENERAL_GENESISPROFILE=SampleDevModeSolo
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:7052 
nohup ./bin/hfDevOrderer &
nohup ./bin/hfDevPeer node start --peer-chaincodedev=true &
mkdir channel-artifacts/
./bin/configtxgen -channelID ch1 -outputCreateChannelTx channel-artifacts/ch1.tx -profile SampleSingleMSPChannel
./bin/configtxgen -channelID ch2 -outputCreateChannelTx channel-artifacts/ch2.tx -profile SampleSingleMSPChannel
./bin/peer channel create --outputBlock channel-artifacts/ch1.block -o 127.0.0.1:7050 -c ch1 -f channel-artifacts/ch1.tx 
./bin/peer channel create --outputBlock channel-artifacts/ch2.block -o 127.0.0.1:7050 -c ch2 -f channel-artifacts/ch2.tx
./bin/peer channel join -b channel-artifacts/ch1.block
./bin/peer channel join -b channel-artifacts/ch2.block

