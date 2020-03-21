# Validator+哨兵节点 部署方案


## 概述

哨兵节点、validator节点部署时，有两点不同：

*	两者配置文件`.cetd/config/config.toml`的设置不同
*  validator节点具有可以生成区块的共识私钥`.cetd/config/priv_validator_key.json`


### 哨兵节点的部署

1. [节点的通用部署步骤](#节点的通用部署步骤)
2. 哨兵节点的配置文件设置
	*	获取validator的seed
		* 在validator的机器上，获取它的seed: `${RUN_DIR}/cetd tendermint show-node-id --home=${RUN_DIR}/.cetd`
	*  进行如下配置
		> 	export RUN_DIR=~~node~~ <br/>
		>	export VALIDATOR_ID=~~ 234d17ad72695c3139953c4e75fc0636121a3b@3.134.44.201:26656~~ <br/>
		>	export CHAIN_SEEDS=~~ 61e905c822f3ed1ae70982cf9ea61453e15104c5@47.75.208.217:26656,8318598ad2a9d47bd9f9a287b329ae23a9201cb3@47.52.106.214:26656~~ <br/>
		> <br/>
		> <br/>
		> <br/>
		> <br/>
		> ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=seeds value='\"${CHAIN_SEEDS}\"' backup=true" <br/>
		>	ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=persistent_peers value='\"${VALIDATOR_ID}\"' backup=true"	<br/>
		>	ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=private_peer_ids value='\"${VALIDATOR_ID}\"' backup=true" <br/>
		>	ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=addr_book_strict value='false' backup=true" <br/>
3. [节点运行](#节点运行)
	



##### 配置文件字段解释

*	seeds: cetd网络的种子节点标识，用于帮助新节点接入整个cetd网络，与网络中的其它节点进行交流。
*	persistent_peers: 配置`validator`节点的标识，会持久链接`validator`节点，断开时，会进行重链；如果未在此处配置这个值，可能`sentry node`在达到链接最大值时，将与`validator`节点的链接随机断开。   	
*	private_peer_ids: 配置`validator`节点的标识，当`sentry node`与网络中的其它节点进行IP地址交换时，不会将该IP地址暴露出去.
*	addr_book_strict: 配置为true，允许`sentry node`链接不可路由的IP地址节点，因为`validator`可以处于保护的目的，处于内网中，不提供对外的IP地址。

<br/>
<br/>

### validator节点的特殊配置

1. [节点的通用部署步骤](#节点的通用部署步骤)
2. validator节点的配置文件设置
	*	获取哨兵的seed
		* 在哨兵的机器上，获取它的seed: `${RUN_DIR}/cetd tendermint show-node-id --home=${RUN_DIR}/.cetd` 
	*  进行如下配置
		> 	export RUN_DIR=~~node~~ <br/>
		>	export SENTRY_NODE_IDS=~~ 234d17ad72695c3139953c4e75fc0636121a3b@3.134.44.201:26656,1231e234a695345c3139953c4e75fc0636121a3b@30.124.14.231:26656~~ <br/>
		> <br/>
		> <br/>
		> <br/>
		> <br/>
		> ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=pex value='false' backup=true" <br/>
		> ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=persistent_peers value='\"${SENTRY_NODE_IDS}\"' backup=true" <br/>
		> ansible localhost -m ini_file -a "path=${RUN_DIR}/.cetd/config/config.toml section=p2p option=addr_book_strict value='false' backup=true" <br/>
3. 	拷贝共识私钥
	*	`cp priv_validator_key.json ${RUN_DIR}/.cetd/config`
4. [节点运行](#节点运行)
5. 获取validator的共识公钥，验证是否正确
	*	`${RUN_DIR}/cetd tendermint show-address --home=${RUN_DIR}/.cetd)"`

##### 配置文件字段解释		
*	pex: 设置为false,禁止validator节点与sentry node节点交换地址簿，保护validator节点的IP地址不会被泄漏出去.<br>
*	persistent_peers: 用`逗号`分隔的`sentry node`节点的标识，validator链接这些`sentry node`节点与整个网络沟通.因为pex标识设置为false,如果验证者节点未配置这个值，会导致validator节点无法加入网络. <br>
*	addr_book_strict: 设置为true，允许validator链接不可路由的内网IP的`sentry node`节点;因为有可能`validator`与`sentry node`位于同一个私有网络，它们之间通过私有网络进行交流. <br>

<br/>
<br/>


### 节点的通用部署步骤

1. 下载新版本节点、genesis.json 文件；
2. 初始化数据目录

##### 下载新版本节点

>	export ARTIFACTS_BASE_URL=https://raw.githubusercontent.com/coinexchain/testnets/master/coinexdex-test-upgrade <br/>
>	export CETD_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetd <br/>
>	export CETCLI_URL=${ARTIFACTS_BASE_URL}/linux_x86_64/cetcli <br/>
>	export GENESIS_URL=${ARTIFACTS_BASE_URL}/genesis.json <br/>
>	export SHA256_CHECKSUM_URL=${ARTIFACTS_BASE_URL}/shasum.md <br/>
>	export CETD_SERVICE_CONF_URL=${ARTIFACTS_BASE_URL}/cetd.service.example <br/>	export RUN_DIR=~~/node~~ <br/>
> <br/>
> <br/>
> <br/>
> <br/>
> 	mkdir ${RUN_DIR} <br/>
>	cd ${RUN_DIR} <br/>
>	curl ${CETD_URL} > cetd <br/>
>	curl ${CETCLI_URL} > cetcli <br/>
>	curl ${GENESIS_URL} > genesis.json <br/>
>	curl ${SHA256_CHECKSUM_URL} > shasum.md <br/>
>	curl ${CETD_SERVICE_CONF_URL} > cetd.service.example <br/>
>	chmod a+x cetd cetcli <br/>
>


##### 初始化新数据目录

> ${RUN_DIR}/cetd init moniker --chain-id=coinexdex2 --home=${RUN_DIR}/.cetd <br/>
> cp ${RUN_DIR}/genesis.json ${RUN_DIR}/.cetd/config <br/>

## 节点运行

