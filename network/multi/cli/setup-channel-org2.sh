#!/bin/bash

echo 'Join Channel..'

CORE_PEER_ADDRESS=peer0.org2.kt.com:7051 peer channel join -b imchannel.block
CORE_PEER_ADDRESS=peer1.org2.kt.com:7051 peer channel join -b imchannel.block

echo 'Done'

echo 'Update Org2 Anchor Peer..'

peer channel update -o orderer0.kt.com:7050 -c imchannel -f ./channel-artifacts/${CORE_PEER_LOCALMSPID}anchors.tx  \
--tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/kt.com/orderers/orderer0.kt.com/msp/tlscacerts/tlsca.kt.com-cert.pem

echo 'Done'
