---
title: Pixelexperience简述
date: 2019-04-01 17:10:55
tags:
        - Android
        - Rom
        - GSI
categories:
        - 闷声作死
---

> 对于内核开源[[1]](https://baike.baidu.com/item/%E5%BC%80%E6%BA%90%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F/4581071)的手机，国内外一些大神总会第一时间将其进行机型适配。以此开发了许许多多著名的ROM，例如~~`CM`~~现在是`Lineage`[[2]](https://www.lineageos.org/)`RR`[[3]](https://www.resurrectionremix.com/)添加了各式各样可玩性。当然这一切都归功于开源大法好`OpenSource`[[5]](https://www.google.com/search?source=hp&ei=5PazXNuIEMaHr7wPtOKC-AY&q=open+source&oq=opensou&gs_l=mobile-gws-wiz-hp.1.0.0i10l8.2920.5917..7454...0.0..0.367.550.0j1j0j1......0....1.......2..41j0.ek1BQ9GsYSo)
<!--more-->
---
## 1. 机型是否能够解锁unlock
### 1.1 解除锁定能够进行线刷bootload
### 1.2 利用bootload刷入*twrp*[[4]](https://twrp.me/)
#### 1.2.1 利用twrp双清*wipe cache*  And  *wipe data* 
`这里的data指的是非内置存储当然8.0之后谷歌对权限收紧，刷完之后也要清除`
#### 1.2.2 刷入Gsi时不用清除System *wipe system*
#### 1.2.3 刷入ROM时要注意底包是否匹配
### 1.3 使用twrp刷入你下载ROM包
#### 1.3.1 刷入 `.img`  *or* `.Zip` 格式的后缀
##### 1.3.1.1 刷入`.img`为后缀的通刷包时一般是不用*wipe system*
##### 1.3.1.2 `.zip`为后缀时，除非是升级包。否则一定要清除*wipe system*
### 1.4 谷歌验证
*由于国内网络的特殊性，而谷歌的服务器被墙。所以每次新刷rom开机时候很大一部分的的人都会卡在开机验证这一界面*
[Disable setupwizard](http://t.cn/EXfV6d5)   `利用twrp刷入`
---






这里另外提供一种方法供没有准备的小伙伴刷机时遇到这个问题
---
> 1. 进入rec
2. 挂载 system
3. 进入rec里的终端管理器
4. 输入命令行
---




```
vi  /system/build.prop
点击 `i` 变成可输入模式
在尾部键入
ro.setupwizard.mode=DISABLED
点击  Esc + : + wq  保存退出
```
or

```
echo "ro.setupwizard.mode=DISABLED" >>/system/build.prop

```

以上三种方法大同小异

---

## 2. 下载rom
这里列几个我经常找rom资源的网站
[Xda论坛](https://forum.xda-developers.com/)[[可能需要小飞机]]()
[小米机型底包#稳定版](https://xiaomifirmwareupdater.com/#stable)
[小米机型底包#开发版](https://xiaomifirmwareupdater.com/#weekly)
[[Aex]](https://downloads.aospextended.com/) `听说是印度人人开发的包，之前用过觉得特色不错`
[[Lineage]](https://download.lineageos.org/) `不废话`
[[ResurrectionRemix]](https://get.resurrectionremix.com/) `以高定制而出名，曾经我最喜欢这个rom，然鹅隐性bug你能忍得了`
[[Pe]](https://download.pixelexperience.org/)  `我当前正在用的包，优化得很舒服。最接近原生的rom之一`

## 3. 个人收集的TG群组or网页链接