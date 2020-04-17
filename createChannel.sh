. ./env.sh
CHANNEL_NAME="$1"
: ${CHANNEL_NAME:="mychannel"}
useORG 1
peer channel create -o orderer.my.sample:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/my.sample/orderers/orderer.my.sample/msp/tlscacerts/tlsca.my.sample-cert.pem

# Join channel
echo "Joining channel named '${CHANNEL_NAME}'"
for i in {1..4..1}
do
    useORG ${i}
    peer channel join -b ${CHANNEL_NAME}.block
done
# Update anchor peer:
echo "Updating anchor peer"
for i in {1..4..1}
do
    useORG ${i}
    peer channel update -o orderer.my.sample:7050 -c $CHANNEL_NAME -f ./channel-artifacts/Org${i}MSPanchors.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/my.sample/orderers/orderer.my.sample/msp/tlscacerts/tlsca.my.sample-cert.pem
done
