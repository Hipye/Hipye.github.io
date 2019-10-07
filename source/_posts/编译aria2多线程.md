---
title: 编译aria2多线程
tags:
  - aria2
  - loader
categories: aria2下载相关
date: 2018-10-21 18:56:48
---



## 写在前面

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
**2019.04.06 //// 新增ubuntu18.10编译条件**
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

解压😳

```
tar zxvf *1.34*.gz
```

## Part_t

**接下来就是最重要的步骤了**

先cd进你解压完毕的目录

```
cd *aria2*  
```

**修改源码修改线程**

```
cd src 
```

------

OptionHandler* op(newNumberOptionHandler(PREF_MAX_CONNECTION_PER_SERVER, TEXT_MAX_CONNECTION_PER_SERVER, '1', 1, 16, 'x'));

修改为

OptionHandler* op(new NumberOptionHandler(PREF_MAX_CONNECTION_PER_SERVER, TEXT_MAX_CONNECTION_PER_SERVER, '128', 1, -1, 'x'));

------

PREF_MIN_SPLIT_SIZE, TEXT_MIN_SPLIT_SIZE, '20M', 1_m, 1_g, 'k'));

修改为

PREF_MIN_SPLIT_SIZE, TEXT_MIN_SPLIT_SIZE, '4K', 1_k, 1_g, 'k'));

------

PREF_PIECE_LENGTH, TEXT_PIECE_LENGTH, '1M', 1_m, 1_g));

修改为

PREF_PIECE_LENGTH, TEXT_PIECE_LENGTH, '4k', 1_k, 1_g));

------

PREF_CONNECT_TIMEOUT, TEXT_CONNECT_TIMEOUT, '60', 1, 600));

修改为

PREF_CONNECT_TIMEOUT, TEXT_CONNECT_TIMEOUT, '30', 1, 600));

------

new NumberOptionHandler(PREF_RETRY_WAIT, TEXT_RETRY_WAIT, '0', 0, 600));

修改为

new NumberOptionHandler(PREF_RETRY_WAIT, TEXT_RETRY_WAIT, '2', 0, 600));

------

new NumberOptionHandler(PREF_SPLIT, TEXT_SPLIT, '5', 1, -1, 's'));

修改为

new NumberOptionHandler(PREF_SPLIT, TEXT_SPLIT, '8', 1, -1, 's'));

------

这里我放出我已经修改好的1.34版本128线程的源码包
[128线程打包[github]](https://github.com/nkozhi/backups/blob/backup/exaria2.tar.gz)


`这里我用的文本编辑器是nano没有则安装即可` 
`nano保存退出的快捷键为ctrl+x 然后点击Y键即可`

代码检查
```
sudo autoreconf -i 
```

```
./configure
```


`再次执行代码检查(若代码检查出现错误则执行此步骤)`

**以上**

## Part_th

安装

```
sudo make && make install
```

等待10分钟左右输入

```
aria2c -v
```

成功则显示如下

![](https://i.loli.net/2019/10/04/ZulcfhyCTBbVe4X.jpg)

下载文件时只需输入

```
aria2c 下载链接
```
## 参考链接
[[Jianshu && 一切不如学习]](https://www.jianshu.com/p/9fc3250df14f) 


