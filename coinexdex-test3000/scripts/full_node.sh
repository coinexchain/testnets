#!/bin/bash

# If your working directory does not match the script configuration, you need to make change to RUN_DIR

set -eux;

sudo apt update
sudo apt install ansible -y

export CHAIN_ID=coinexdex-test3000
export CHAIN_SEEDS=e5516ddccfa5361ff1482422cebaefbac0ba6995@3.134.208.169:26656
export ARTIFACTS_BASE_URL=https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test3000
export CETD_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetd
export CETCLI_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli
export GENESIS_URL=${ARTIFACTS_BASE_URL}/genesis.json
export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example
export MD5_CHECKSUM_URL=${ARTIFACTS_BASE_URL}/sha256.sum

export RUN_DIR=/home/ubuntu/node
sudo mkdir -p ${RUN_DIR}
sudo chown $USER ${RUN_DIR}
export NODE_NAME=hello1
cd ${RUN_DIR}
curl ${CETD_URL}  > cetd
curl ${CETCLI_URL} > cetcli
curl ${GENESIS_URL} > genesis.json 
chmod a+x ${RUN_DIR}/cetd ${RUN_DIR}/cetcli

${RUN_DIR}/cetd init ${NODE_NAME} --chain-id=${CHAIN_ID} --home=${RUN_DIR}/.cetd
cp ${RUN_DIR}/genesis.json ${RUN_DIR}/.cetd/config/genesis.json
${RUN_DIR}/cetd tendermint show-node-id --home=${RUN_DIR}/.cetd

ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=seeds value='\"${CHAIN_SEEDS}\"' backup=true"

ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=addr_book_strict value='false' backup=true"

nohup ${RUN_DIR}/cetd start --home=${RUN_DIR}/.cetd --rpc.laddr=tcp://0.0.0.0:26657 --minimum-gas-prices=20.0cet  &
