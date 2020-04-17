cryptogen generate --config=./crypto-config.yaml --output="crypto-config"
export $CHANNEL_NAME=mychannel
mkdir channel-artifacts
configtxgen -profile FourOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block -channelID $CHANNEL_NAME

## Organization1
configtxgen -profile FourOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

## Organization2
configtxgen -profile FourOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP

## Organization3
configtxgen -profile FourOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org3MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org3MSP

## Organization4
configtxgen -profile FourOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org4MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org4MSP
