---
title: hexo博客搭建
tags:
  - 博客
  - hexo
abbrlink: 31415
date: 2018-10-28 16:33:18
categories:
---



> 用hexo来搭建轻量博客然后托管在`GIt`或者`Coding`上一顿傻瓜式的操作基本上属于你的私人定制的个人博客就完成了。
<!--more-->


> ##### 1 . 下载[nodejs](http://nodejs.cn/)

这里我下载的是**Windowns**的安装包，**Linux**的小伙伴可以去下载二进制版本的包  或者自己编译安装。

​     **ubuntu** 的命令为

```
sudo apt install nodejs -y
```

> ##### 2 . 安装nrm 切换淘宝源 

先查看自己的自己是否成功安装 **node** `and` **npm**

在**Windowns**上在任意按下`Shift`键+右键打开**Power Shell**

```
node -v
npm -v
```

![成功.1](https://img02.sogoucdn.com/app/a/100520146/d427112def7648f6bbeabdde2dabd947)
![成功.2](https://img02.sogoucdn.com/app/a/100520146/1b7d07f2516663828c3b353cf2c8c279)

安装成功则输入如下

```
npm i nrm --save
```

换源

```
nrm use taobao
```

> ##### 3 . 安装hexo 

```
npm i hexo-cli --save
```

> ##### 4 . 下载并安装git bash

[点击链接](https://git-scm.com/downloads/)选择你的系统所需要的版本

> ##### 5 . 生成你的博客

```
hexo init 你要生成的博客根文件名
```

![](https://ws1.sinaimg.cn/large/005Xh6Nfgy1fwobqa9laaj30kr0npgr3.jpg)



### 以上你的hexo博客基础已经达成 

```
在浏览器中输入 127.0.0.1:4000  测试是否成功
```

------

