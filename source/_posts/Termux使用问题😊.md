---
title: Termux使用问题
tags:
  - Android
  - App
  - Linux
abbrlink: 8635
date: 2018-12-07 23:45:20
categories:
---

> 钟爱命令行的大佬总会想尽方法的折腾，虽然android本质是脱胎于Linux但是功能上已经和相去甚远。比如我喜欢在手机上用M笔记写上我在折腾上的一小点心得，但是又嫌麻烦不想第二次转存到电脑上再用来解决一大类我所需要的难题。

<!--more-->

# 1. 安装

这类的软件一般在各大应用市场都有地址以下我贴出酷安的下载地址😀

[下载地址](https://www.coolapk.com/apk/com.termux)

作者用的是国外的云所以安装环境的过程稍微比较慢

成功如下

![图1](https://ws1.sinaimg.cn/large/005Xh6Nfgy1fxymn8s00dj30u01qcae4.jpg)

------



#2.升级组件安装必要软件

此外可能需要更新一下软件包

```
pkg update && pkg upgrade
```

例如我个人比较喜欢的编辑软件`nano`

```
pkg install -y nano
```

编辑你想编辑的文件

**ctrl+x退出** ***想要保存直接输入Y即可***

so  easy！！

