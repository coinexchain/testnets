# How to setup coinexdex-test2005

- please refer to [setup-guide](https://github.com/coinexchain/devops) but with following parameters:

# parameters
```shell
export CHAIN_ID=coinexdex-test2005
export CHAIN_SEEDS=8a378459b49ddcf2931ba968dc214621a48d22b3@47.75.208.217:26656,fe3b227eedd5bb97cd72ff40df31050434f7e883@47.52.106.214:26656
export ARTIFACTS_BASE_URL=https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test2005
export CETD_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetd
export CETCLI_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli
export GENESIS_URL=${ARTIFACTS_BASE_URL}/genesis.json
export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example
export MD5_CHECKSUM_URL=${ARTIFACTS_BASE_URL}/md5.sum

export FAUCET_URL=
export REST_API=
export TESTNET_RPC_URL=47.75.208.217:26657
export TESTNET_EXPLORER_URL=testnet.coinex.org
```
