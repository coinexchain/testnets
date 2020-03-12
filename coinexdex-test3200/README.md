# 测试网节点升级

1. 下载新版本节点、genesis.json 文件；
2. 初始化新数据目录
3. 启动节点


## 下载新版本
> export CHAIN_ID=coinexdex-test3200 <br/>
> export CHAIN_SEEDS=1198ffc62ef7b4f0395871467d1644bb65c7b348@3.134.208.169:26656  <br/>
> export ARTIFACTS_BASE_URL=`https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test3200` <br/>
> export CETD_URL=`${ARTIFACTS_BASE_URL}/linux_x86_64/cetd` <br/>
> export CETCLI_URL=`${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli` <br/>
> export GENESIS_URL=`${ARTIFACTS_BASE_URL}/genesis.json` <br/>
> export SHA256_CHECKSUM_URL=`${ARTIFACTS_BASE_URL}/sha256.sum` <br/>
> export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example <br/>
> export RUN_DIR=~~/home/ubuntu/test-node~~ <br/>
>  <br/> 
> <br/>
> <br/>
> mkdir `${RUN_DIR}` <br/>
> cd `${RUN_DIR}` <br/>
> curl `${CETD_URL}` >  cetd <br/>
> curl `${CETCLI_URL}` > cetcli <br/>
> curl `${GENESIS_URL}` > genesis.json <br/>
> curl ${CETD_SERVICE_CONF_URL} > cetd.service.example <br/>
> chmod a+x cetd cetcli <br/>



## 创建新的数据目录

1. `./cetd init ViaWallet --chain-id=coinexdex-test3100 --home=.cetd`
2. 拷贝下载的genesis.json 到数据目录: `cp genesis.json .cetd/config`
3. 如果是验证者节点：

    *   拷贝原节点数据目录的`priv_validator_key.json` 至新数据目录，该文件所在的位置：`.cetd/config`
4. 配置节点seeds

   *    `ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=seeds value='\"${CHAIN_SEEDS}\"' backup=true"`


    
## 启动新节点    

> ansible localhost -m ini_file -a "path=${RUN_DIR}/cetd.service.example section=Service option=ExecStart value='${RUN_DIR}/cetd start --home=${RUN_DIR}/.cetd --minimum-gas-prices=20.0cet' backup=true"<br>
> sudo mv ${RUN_DIR}/cetd.service.example /etc/systemd/system/cetd.service <br>
> sudo ln -s /etc/systemd/system/cetd.service /etc/systemd/system/multi-user.target.wants/cetd.service <br>
> sudo systemctl daemon-reload  <br>
> sudo systemctl status cetd  <br>
> sudo systemctl start cetd  <br>
> sudo systemctl status cetd  <br>

## 新链高度

新链继续延续旧链的高度，第一个块从**4423629**开始。
