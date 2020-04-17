. ./env.sh
for i in {1..4..1}
do
    peer chaincode install -n mycc -v 1.0 -p github.com/chaincode/
done

peer chaincode instantiate -o orderer.my.sample:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/my.sample/orderers/orderer.my.sample/msp/tlscacerts/tlsca.my.sample-cert.pem -C mychannel -n mycc -v 1.0 -c '{"Args":["initLedger"]}' -P "OR ('Org1MSP.member','Org2MSP.member','Org3MSP.member','Org4MSP.member')"
