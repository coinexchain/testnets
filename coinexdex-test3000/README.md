# How to setup coinexdex-test3000

- please refer to [setup-guide](https://github.com/coinexchain/devops) but with following parameters:

# parameters
```shell
export CHAIN_ID=coinexdex-test3000
export CHAIN_SEEDS=e5516ddccfa5361ff1482422cebaefbac0ba6995@3.134.208.169:26656,4be0875c3e27d2b6f022df9d843517796878d363@3.13.170.79:26656
export ARTIFACTS_BASE_URL=https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test3000
export CETD_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetd
export CETCLI_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli
export GENESIS_URL=${ARTIFACTS_BASE_URL}/genesis.json
export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example
export MD5_CHECKSUM_URL=${ARTIFACTS_BASE_URL}/sha256.sum

export FAUCET_URL=http://faucet.coinex.org/
export REST_API=http://3.13.170.79:1317/swagger/
export TESTNET_RPC_URL=3.13.170.79:26657
export TESTNET_EXPLORER_URL=https://testnet.coinex.org/
```

