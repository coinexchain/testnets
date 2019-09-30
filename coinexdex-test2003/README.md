# How to setup coinexdex-test2003

- please refer to [testnet-guide](https://github.com/coinexchain/testnets/blob/master/coinexdex-test/testnet-guide.md) but with following parameters:

# parameters
```shell

export CHAIN_ID=coinexdex-test2003
export CHAIN_SEEDS=5d78fc7d5d5947f6525c6fbc62a6517c3875cb00@18.140.188.15:26656,e51c2e356e217b621c0b2289ce786f30afecb174@18.140.191.248:26656
export ARTIFACTS_BASE_URL=https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test2003
export CETD_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetd
export CETCLI_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli
export GENESIS_URL=${ARTIFACTS_BASE_URL}/genesis.json
export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example
export MD5_CHECKSUM_URL=${ARTIFACTS_BASE_URL}/md5.sum
export FAUCET_URL=http://18.140.188.15
export FAUCET_ADDR=cettest17lk6szw330e25xpz7w60aljcmw27g3aum63ax8
export REST_API=http://18.140.188.15:1317/swagger/
export REST_API=http://18.140.191.248:1317/swagger/
export TESTNET_RPC_URL=18.140.188.15:26657
export TESTNET_EXPLORER_URL=http://18.139.166.177
```