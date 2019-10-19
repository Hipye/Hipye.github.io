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

### 钟爱命令行的大佬总会想尽方法的折腾，虽然android本质是脱胎于Linux但是功能上已经和相去甚远。比如我喜欢在手机上用M笔记写上我在折腾上的一小点心得，但是又嫌麻烦不想第二次转存到电脑上再用来解决一大类我所需要的难题。

<!--more-->

# 1. 安装

这类的软件一般在各大应用市场都有地址以下我贴出酷安的下载地址😀

[下载地址](https://www.coolapk.com/apk/com.termux)

作者用的是国外的云所以安装环境的过程稍微比较慢

成功如下

![图1](https://ws1.sinaimg.cn/large/005Xh6Nfgy1fxymn8s00dj30u01qcae4.jpg)

------


# 2.修改顶部小键盘
```
  mkdir $HOME/.termux
	echo -e "extra-keys = [['TAB','-',',','\"','.','/','*'],['ESC','(','HOME','UP','END',')','PGUP'],['CTRL','[','LEFT','DOWN','RIGHT',']','PGDN']]" > $HOME/.termux/termux.properties
```
成功显示如下
![](https://i.loli.net/2019/10/20/yFxH1LSiCXgqPto.jpg)

# 3.修改中国镜像源不然速度太慢
```
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' $PREFIX/etc/apt/sources.list
```
如果在更新的过程中卡住可以强行停止软件然后再次`pkg up`按照提示系统提示`dpkg --configure -a`
`在0.70版本之后好像作者添加了游戏？还有其他的源所以每次验证镜像源地址的时候会很慢`

# 4.升级组件安装必要软件

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

