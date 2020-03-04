# 测试网节点升级

1. 下载新版本节点、genesis.json 文件；
2. 初始化新数据目录
3. 启动节点


## 下载新版本
export CHAIN_ID=coinexdex-test3100
export CHAIN_SEEDS=597a40d15ca5e6dc8fb0c4a4a098b7b96320964e@3.134.208.169:26656
export ARTIFACTS_BASE_URL=`https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test3100`
export CETD_URL=`${ARTIFACTS_BASE_URL}/linux_x86_64/cetd`
export CETCLI_URL=`${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli`
export GENESIS_URL=`${ARTIFACTS_BASE_URL}/genesis.json`
export SHA256_CHECKSUM_URL=`${ARTIFACTS_BASE_URL}/sha256.sum`


export RUN_DIR=test-node
mkdir `${RUN_DIR}`
cd `${RUN_DIR}`
curl `${CETD_URL}` > cetd
curl `${CETCLI_URL}` > cetcli
curl `${GENESIS_URL}` > genesis.json
chmod a+x cetd cetcli

## 创建新的数据目录

1. `cetd init ViaWallet --chain-id=coinexdex-test3100 --home=.cetd`
2. 拷贝下载的genesis.json 到数据目录: `cp genesis.json .cetd/config`
3. 如果是验证者节点：

    *   拷贝原节点数据目录的`priv_validator_key.json` 至新数据目录，该文件所在的位置：`.cetd/config`
    
    
## 启动新节点    

> ansible localhost -m ini_file -a "path=${RUN_DIR}/cetd.service.example section=Service option=ExecStart value='${RUN_DIR}/cetd start --home=${RUN_DIR}/.cetd --minimum-gas-prices=20.0cet' backup=true"
> sudo mv ${RUN_DIR}/cetd.service.example /etc/systemd/system/cetd.service
> sudo ln -s /etc/systemd/system/cetd.service /etc/systemd/system/multi-user.target.wants/cetd.service
> sudo systemctl daemon-reload
> sudo systemctl status cetd
> sudo systemctl start cetd
> sudo systemctl status cetd

## 新链高度

新链继续延续旧链的高度，第一个块从**4423629**开始。


