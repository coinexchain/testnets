##概述
从旧链导出genesis.json，用升级版本的二进制cetd对genesis.json进行migrate加工，加工后的genesis用于新链的启动
##步骤
1. 停止旧节点
2. 用旧节点对应的cetd执行
```cetd export --height=公告指定升级高度 --home=旧链数据目录，比如/home/ubuntu/.cetd  > exported.genesis.json```
3. sha256sum exported.genesis.json
4. 与coinexchain官方提供的导出genesis.json的hash值比较，校验是否一致，如果一致，进入到下一步，如果不一致，请联系coinex chain技术支持人员
5. 将exported.genesis.json拷贝到升级版本的二进制cetd所在目录，执行migrate操作
```cetd2 migrate ./exported.genesis.json --genesis-block-height=公告指定升级高度 --output genesis.json```
6. 这一步生成的genesis.json不用比较hash值，该genesis.json文件为最终升级用的文件，升级步骤参考https://github.com/coinexchain/dex-manual/blob/master/docs/AtlantisFork/AtlantisHardForkGuide.cn.md
