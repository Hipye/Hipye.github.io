---
title: aria2配置文件
tags:
  - aria2
  - linux
abbrlink: 50509
date: 2018-12-18 23:02:14
categories:
---


> 承接上一个关于aria2编译的[Page](https://z.hipye.top/link-get/8174006/)所说的下载功能。aria2为众多老司机喜欢的一点就是可是利用`Bittorrent`功能下载种子or磁力😏

<!--more-->


## 1. 安装aria2
*[安装教程](https://z.hipye.top/link-get/8174006/)*

----

## 2. 创建配置文件
```
mkdir /etc/aria2
touch /etc/aria2/aria2.conf
vim /etc/aria2/aria2.conf
```
----

## 3. 创建默认的配置文件`/etc/aria2`

`Esc`+`:`+`wq` 保存退出

----

  ***我的配置文件*** ↓↓↓
```
##下载默认的目录

#下载的文件存放
dir=/mnt/sdcard/Downloads
#开启ipv6
disable-ipv6=true
#开启rpc
enable-rpc=true
#总是保持连接
rpc-allow-origin-all=true
#监听rpc
rpc-listen-all=true
#rpc-listen-port=6800
#断点续传
continue=true
#进度保存.默认从session中读取下载的文件
input-file=/etc/aria2/aria2.session
save-session=/etc/aria2/aria2.session
save-session-interval=30
#最大同时下载量
#max-concurrent-downloads=3
# 启用磁盘缓存, 0为禁用缓存, 需1.16以上版本, 默认:16M
disk-cache=32M
listen-port=51413


## BT/PT下载相关 ##

# 当下载的是一个种子(以.torrent结尾)时, 自动开始BT任务, 默认:true
follow-torrent=true
# BT监听端口, 当端口被屏蔽时使用, 默认:6881-6999
listen-port=51413
# 单个种子最大连接数, 默认:55
#bt-max-peers=55
# 打开DHT功能, PT需要禁用, 默认:true
enable-dht=true
# 打开IPv6 DHT功能, PT需要禁用
enable-dht6=false
# DHT网络监听端口, 默认:6881-6999
#dht-listen-port=6881-6999
# 本地节点查找, PT需要禁用, 默认:false
bt-enable-lpd=false
# 种子交换, PT需要禁用, 默认:true
enable-peer-exchange=false
# 每个种子限速, 对少种的PT很有用, 默认:50K
#bt-request-peer-speed-limit=50K
# 客户端伪装, PT需要
peer-id-prefix=-TR2770-
user-agent=Transmission/2.77
# 当种子的分享率达到这个数时, 自动停止做种, 0为一直做种, 默认:1.0
seed-ratio=1.0
# 强制保存会话, 即使任务已经完成, 默认:false
# 强制保存会话, 即使任务已经完成, 默认:false
# 较新的版本开启后会在任务完成后依然保留.aria2文件
#force-save=false
# BT校验相关, 默认:true
#bt-hash-check-seed=true
# 继续之前的BT任务时, 无需再次校验, 默认:false
bt-seed-unverified=true
# 保存磁力链接元数据为种子文件(.torrent文件), 默认:false
bt-save-metadata=true
# bt-tracker数据来自https://github.com/ngosang/trackerslist/blob/master/trackers_all_udp.txt
bt-tracker=udp://tracker.coppersurfer.tk:6969/announce,udp://tracker.internetwarriors.net:1337/announce,http://tracker.internetwarriors.net:1337/announce,udp://tracker.opentrackr.org:1337/announce,udp://9.rarbg.to:2710/announce,udp://exodus.desync.com:6969/announce,udp://tracker1.itzmx.com:8080/announce,udp://explodie.org:6969/announce,http://tracker1.itzmx.com:8080/announce,http://explodie.org:6969/announce,udp://ipv4.tracker.harry.lu:80/announce,udp://open.demonii.si:1337/announce,udp://denis.stalker.upeer.me:6969/announce,udp://thetracker.org:80/announce,udp://bt.xxx-tracker.com:2710/announce,udp://tracker.torrent.eu.org:451/announce,udp://tracker.tiny-vps.com:6969/announce,udp://tracker.port443.xyz:6969/announce,udp://retracker.lanta-net.ru:2710/announce,http://tracker.port443.xyz:6969/announce,udp://tracker.uw0.xyz:6969/announce,udp://tracker.iamhansen.xyz:2000/announce,udp://open.stealth.si:80/announce,http://open.acgnxtracker.com:80/announce,udp://zephir.monocul.us:6969/announce,udp://tracker.vanitycore.co:6969/announce,https://tracker.fastdownload.xyz:443/announce,https://opentracker.xyz:443/announce,http://retracker.telecom.by:80/announce,http://opentracker.xyz:80/announce,http://open.trackerlist.xyz:80/announce,udp://tracker.cyberia.is:6969/announce,http://tracker.city9x.com:2710/announce,http://tracker3.itzmx.com:6961/announce,http://torrent.nwps.ws:80/announce,wss://tracker.openwebtorrent.com:443/announce,udp://tracker4.itzmx.com:2710/announce,udp://tracker1.wasabii.com.tw:6969/announce,udp://tracker.swateam.org.uk:2710/announce,udp://tracker.kamigami.org:2710/announce,udp://tracker.filepit.to:6969/announce,udp://tracker.dler.org:6969/announce,udp://torrentclub.tech:6969/announce,udp://pubt.in:2710/announce,udp://bittracker.ru:6969/announce,udp://amigacity.xyz:6969/announce,http://tracker4.itzmx.com:2710/announce,http://tracker2.itzmx.com:6961/announce,http://tracker1.wasabii.com.tw:6969/announce,http://tracker.torrentyorg.pl:80/announce,http://torrentclub.tech:6969/announce,http://t.nyaatracker.com:80/announce,http://retracker.mgts.by:80/announce,http://private.minimafia.nl:443/announce,http://prestige.minimafia.nl:443/announce,http://open.acgtracker.com:1096/announce,http://fxtt.ru:80/announce,http://bittracker.ru:80/announce,http://amigacity.xyz:6969/announce,http://0d.kebhana.mx:443/announce,wss://tracker.fastcast.nz:443/announce,wss://tracker.btorrent.xyz:443/announce,wss://ltrackr.iamhansen.xyz:443/announce,udp://tracker.justseed.it:1337/announce,udp://packages.crunchbangplusplus.org:6969/announce,https://1337.abcvg.info:443/announce,http://tracker.tfile.me:80/announce.php,http://tracker.tfile.me:80/announce,http://tracker.tfile.co:80/announce,http://share.camoe.cn:8080/announce,http://peersteers.org:80/announce
## 下载连接相关 ##

# 最大同时下载任务数, 运行时可修改, 默认:5
max-concurrent-downloads=5
# 同一服务器连接数, 添加时可指定, 默认:1
max-connection-per-server=10
# 最小文件分片大小, 添加时可指定, 取值范围1M -1024M, 默认:20M
# 假定size=10M, 文件为20MiB 则使用两个来源下载; 文件为15MiB 则使用一个来源下载
min-split-size=10M
# 单个任务最大线程数, 添加时可指定, 默认:5
split=10
# 整体下载速度限制, 运行时可修改, 默认:0
max-overall-download-limit=0
# 单个任务下载速度限制, 默认:0
max-download-limit=0
# 整体上传速度限制, 运行时可修改, 默认:0
max-overall-upload-limit=0
# 单个任务上传速度限制, 默认:0
max-upload-limit=0
#运行覆盖已存在文件
allow-overwrite=true
#自动重命名
auto-file-renaming=true
```

----
## 4.执行配置文件
```
aria2c --conf-path=/etc/aria2/aria2.conf -D
```


<p align="center"> **写在前面**</p>

> ~~aria2主要功能当然是下载~~🙂虽然是废话但是既然叫做下载神器它的用处经过网络上各位大神轮番折腾 发掘出很多可以称得上老司机必备的功能。比如BT下载(全称: `Bittorrent` )/滑稽/  

**使用文档**  
[官方文档(en)](https://aria2.github.io/)


<!--more-->
> ## 编译前注意事项

1. 根据系统以及平台的不同，编译的方法大同小异。本教程仅提供linux发行版**Kali liunx**的编译方法。
2. 因为国内的网络你懂的的某些特殊原因，可能在[gayhub](https://www.github.com)上下载作者提供的[源码](https://github.com/aria2/aria2/releases)的时候会出现下载失败以及访问龟速还有 404/`笑而不语`。
3. 由于不是和我存在同样操作环境下可能会有不同状况发生所以请善用[谷歌](https://www.google.com)`Or`[百度](https://www.baidu.com)

------

## Part_o

先更新一下系统的软件

```
sudo apt-get update && apt-get upgrade -y
```

安装编译时官方说明需要的依赖

```
sudo apt-get install -y gcc libgnutls28-dev nettle-dev libssh2-1-dev libc-ares-dev libxml2-dev zlib1g-dev wget perl libsqlite3-dev pkg-config libcppunit-dev autoconf automake autotools-dev autopoint libtool git c++11 g++
```
**2019.04.06   // 新增ubuntu18.10编译条件**
```
sudo apt-get update && sudo apt-get install libgnutls28-dev nettle-dev libgmp-dev libssh2-1-dev libc-ares-dev libxml2-dev zlib1g-dev libsqlite3-dev pkg-config libcppunit-dev autoconf automake autotools-dev autopoint libtool git gcc g++ libxml2-dev make quilt

```

centos指令如下

```
yum install gcc-g++ gcc -y 
```


下载aria2的源码这里我下载的是[1.34](https://github.com/aria2/aria2/archive/release-1.34.0.tar.gz)版本

```
wget https://github.com/aria2/aria2/archive/release-1.34.0.tar.gz
```

解压**大佬们别介意我偷懒用通配符**😳
