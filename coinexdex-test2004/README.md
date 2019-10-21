# How to setup coinexdex-test2004

- please refer to [setup-guide](https://github.com/coinexchain/devops) but with following parameters:

# parameters
```shell
export CHAIN_ID=coinexdex-test2004
export CHAIN_SEEDS=b71a1fbfd2aeaad55eec6d2e61c4d2b431a20e09@3.132.21.89:26656,5b8ee18bc3745f2e6d141ea7133a73013b8da200@18.190.80.148:26656
export ARTIFACTS_BASE_URL=https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test2004
export CETD_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetd
export CETCLI_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli
export GENESIS_URL=${ARTIFACTS_BASE_URL}/genesis.json
export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example
export MD5_CHECKSUM_URL=${ARTIFACTS_BASE_URL}/md5.sum

export FAUCET_URL=http://18.190.80.148
export REST_API=http://18.190.80.148:1317/swagger/
export REST_API=http://3.132.21.89:1317/swagger/
export TESTNET_RPC_URL=18.190.80.148:26657
export TESTNET_EXPLORER_URL=http://
```