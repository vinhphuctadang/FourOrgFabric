 useORG() {
    ORG="$1"
    CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org${ORG}.my.sample/users/Admin@org${ORG}.my.sample/msp
    CORE_PEER_ADDRESS=peer0.org${ORG}.my.sample:7051
    CORE_PEER_LOCALMSPID="Org${ORG}MSP"
    CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org${ORG}.my.sample/peers/peer0.org${ORG}.my.sample/tls/ca.crt
    echo "Using organization ${ORG}"
}
