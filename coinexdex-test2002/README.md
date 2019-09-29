# How to setup coinexdex-test2002

- please refer to [testnet-guide](https://github.com/coinexchain/testnets/blob/master/coinexdex-test/testnet-guide.md) but with following parameters:

# parameters
```shell
export CHAIN_ID=coinexdex-test2002
export CHAIN_SEEDS=752ee6947aaafbfabc56938b4f65bfdf9a62e4bb@3.19.184.4:26656,7562b9dff832ddcd3f019d7a30262ba8bff7a383@18.189.200.85:26656
export ARTIFACTS_BASE_URL=https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test2002
export CETD_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetd
export CETCLI_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli
export GENESIS_URL=${ARTIFACTS_BASE_URL}/genesis.json
export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example
export MD5_CHECKSUM_URL=${ARTIFACTS_BASE_URL}/md5.sum

export FAUCET_URL=http://18.189.200.85/
export FAUCET_ADDR=cettest1z38rpjhl5ldge7svxnkuudwsdu89ad2z6dredx
export REST_API=http://18.189.200.85:1317/swagger/
export REST_API=http://3.19.184.4:1317/swagger/
export TESTNET_RPC_URL=18.189.200.85:26657
export TESTNET_EXPLORER_URL=http://18.140.213.163
```