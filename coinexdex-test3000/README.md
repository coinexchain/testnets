# How to setup coinexdex-test3000

- please refer to [setup-guide](https://github.com/coinexchain/devops) but with following parameters:

# parameters
```shell
export CHAIN_ID=coinexdex-test3000
export CHAIN_SEEDS=f660dae8095097d67f29d6e0042edd34bed030b2@3.134.208.169:26656
export ARTIFACTS_BASE_URL=https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test3000
export CETD_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetd
export CETCLI_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli
export GENESIS_URL=${ARTIFACTS_BASE_URL}/genesis.json
export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example
export MD5_CHECKSUM_URL=${ARTIFACTS_BASE_URL}/md5.sum

export FAUCET_URL=http://18.190.80.148
export REST_API=http://18.190.80.148:1317/swagger/
export REST_API=http://3.132.21.89:1317/swagger/
export TESTNET_RPC_URL=18.190.80.148:26657
export TESTNET_EXPLORER_URL=http://47.244.44.205/
```