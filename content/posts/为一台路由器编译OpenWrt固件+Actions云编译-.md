---
title: "为一台路由器编译OpenWrt固件+Actions云编译"
date: 2021-02-04T07:39:44Z
draft: false
---

{{< admonition abstract >}}
买了个路由器总喜欢折腾一些从一开始用的别人编译的路由器得固件从潘多拉到OpenWrt用过零零散散得固件总觉得少了点什么 所以一时兴起自己搞起编译固件
首先使用的是win10的wsl内建ubuntu20.04开始编译但总是报错
{{< /admonition >}}
本地编译

## 添加依赖
```
sudo apt-get update -y 
sudo apt-get install -y git subversion g++ zlib1g-dev build-essential git python python3 python3-distutils libncurses5-dev gawk gettext unzip file libssl-dev wget libelf-dev ecj fastjar java-propose-classpath sudo 
apt-get install build-essential libncursesw5-dev python unzip
```

## clone[lean]源码
```
git clone https://github.com/coolsnowwolf/lede.git 
```
## 添加第三方软件包

既然开整那就弄点不一样的
先编辑基础配置文件<font color="#009DDC">**feeds.conf.default**</font>
```
echo "src-git hipye https://gitee.com/hipye/openwrt-packages" >> feeds.conf.default 
```
## 首次编译
```
./scripts/feeds clean 
./scripts/feeds update -a 
./scripts/feeds install -a 
make menuconfig 
```

前两项的必须选好 第一项是选择cpu的类别 第二项是你的路由型号

### dl包
由于国内的网络环境导致在下载所需软件包时会导致失败这里提供一个国内dl镜像[gitee](https://gitee.com/tolqy/openwrt-lede-dl)

### 编译
```
make download -j(nproc) make -j(nproc) V=s 
```
编译好的固件在/lede/bin/targets/xxx下

### 二次编译
```
./scripts/feeds update -a
 ./scripts/feeds install -a
make defconfig
make -j8 download
make -j(nproc) V=s
```

## 云编译

1. 注册一个github账号相信这个不会难先fork一下 esirplayground 的源码
2. 会看得懂.congfig

我的配置内容如下
p2w_r619ac

<font color="#009DDC">这里的.config文件会在自动编译被引用到注意.github/workflows下的Build_OP_##.yml 没有则自己新建*
我的示例如下</font>
```
#=======================================# Description: Build OpenWrt using GitHub Actions # Lisence: MIT 
# Author: eSirPlayground 
# Youtube Channel: https://goo.gl/fvkdwm #======================================= name: Build_R619AC on: release: types: [published] push: branches: - master #schedule: # - cron: 0 8 * * 5 #watch: # types: [started] jobs: build: runs-on: ubuntu-latest steps: - name: Checkout uses: actions/checkout@master - name: Initialization environment env: DEBIAN_FRONTEND: noninteractive run: | docker rmi `docker images -q` echo "Deleting files, please wait ..." sudo rm -rf \ /usr/share/dotnet \ /etc/mysql \ /etc/php sudo -E apt-get -y purge \ azure-cli \ ghc* \ zulu* \ hhvm \ llvm* \ firefox \ google* \ dotnet* \ powershell \ openjdk* \ mysql* \ php* sudo -E apt-get update sudo -E apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev patch unzip lib32gcc1 libc6-dev-i386 subversion flex node-uglify gcc-multilib g++-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils libelf-dev autoconf automake libtool autopoint device-tree-compiler libuv-dev python3.6 zlib1g-dev upx-ucl node-uglify antlr3 gperf sudo -E apt-get -y autoremove --purge sudo -E apt-get clean - name: Clone source code env: REPO_URL: https://github.com/coolsnowwolf/lede REPO_BRANCH: master run: | git clone --depth 1 $REPO_URL -b $REPO_BRANCH openwrt cd openwrt sed -i '5s/#//' feeds.conf.default echo "src-git lienol https://github.com/Lienol/openwrt-package" >> feeds.conf.default - name: Update & Install feeds working-directory: ./openwrt run: | ./scripts/feeds clean ./scripts/feeds update -a ./scripts/feeds install -a ./scripts/feeds install -a - name: Configuration Customization - Build_p2w-128m env: CONFIG_FILE: 'p2w_r619ac-128m.config' run: | [ -e $CONFIG_FILE ] && mv $CONFIG_FILE openwrt/.config chmod +x ./customize.sh && ./customize.sh cd openwrt && make defconfig - name: Download package working-directory: ./openwrt run: | make download -j$(nproc) find dl -size -1024c -exec ls -l {} \; find dl -size -1024c -exec rm -f {} \; - name: Build firmware working-directory: ./openwrt run: | echo -e "$(nproc) thread build." make -j$(nproc) V=s - name : Upload artifact uses: actions/upload-artifact@master with: name: OpenWrt path: openwrt/bin 
```
`在第76行处修改配置文件名`
`在第78行处引用你自动编译的配置名`
```
- name: Configuration Customization - ### 
#这里修改得名字就是你自动打包后的文件名字 
- env
: CONFIG_FILE: '###' 
#这里是你在根目录下自己修改的*.config 
```

第三方编译软件包 Lienol/openwrt

官方原版地址 openwrt

第三方固件地址 lede

利用CI自动构建项目
- esirplayground/AutoBuild-OpenWrt
- Actions-OpenWrt

