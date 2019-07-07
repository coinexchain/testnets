# Join Coinex DEX Chain Testnet Guide

## Testnet parameters
- chain-id: coinexdex-test
- seeds info:
    ```
    seeds = "3114c03fce4e1197d7349f620b137c768dff476f@35.163.254.168:26656,3e358dd768523a31c1c76c456ce320c9f9311c02@52.9.48.13:26656,159106d7999d886eb8be67c257115dbd006a8579@54.183.154.68:26656"
    ```

## Prepare
- Download binary and genesis.json 
    > git clone git@github.com:coinexchain/testnets.git

    > cd testnets

- About files:
    ```
    testnets/coinexdex-test/
    ├── genesis.json           <-- genesis configuration 
    └── linux_x86_64
        ├── cetcli             <-- rpc client
        └── cetd               <-- fullnode daemon
    ```

## Init fullnode
- Init fullnode data dir: 
    > cetd init `moniker_name` --chain-id=`coinexdex-test`
    - args: 
        - `moniker_name`: name of your fullnode
        - --chain-id:  chain id to join

    - example:
        ```
        cetd init MyNodeName --chain-id=coinexdex-test
        ```
    
- Deploy genesis configuration
    > cp ./genesis.json ~/.cetd/config/genesis.json

- Set seeds info in `~/.cetd/config/config.toml`
    - replace default `seeds = ""` with
        ```
        seeds = "3114c03fce4e1197d7349f620b137c768dff476f@35.163.254.168:26656,3e358dd768523a31c1c76c456ce320c9f9311c02@52.9.48.13:26656,159106d7999d886eb8be67c257115dbd006a8579@54.183.154.68:26656"
        ```

- Start your node
    > ./cetd start

    - notes: if you want the node running in background, use nohup or setup it as a service of your OS
        - example: `nohup ./cetd start &`
    - check node status by: `cetcli status`


## Join testnet as validator



---
## Diagnosis


## Server configurations
- ulimit
- port 26656 26657


## Join Developer Channel
- [link](https://join.slack.com/t/coinexchain/shared_invite/enQtNjc2NjI1NTU3MDI0LTQzNWZkMTdlMzlhNTUxOWYwNzJjNWNjNDI5OGMxMmQxNDcxZWVlOGU1MjBiOGIyNWQ0YzRjYTE2ODU1MWMxNWU)