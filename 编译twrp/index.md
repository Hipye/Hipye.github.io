# 编译twrp


> 系统:Ubuntu16.04
内存:≥4G
磁盘空间:≥50G
---

## 安装系统环境变量
```
sudo apt update
sudo apt install git-core gnupg flex bison gperf build-essential \
zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
libgl1-mesa-dev libxml2-utils xsltproc unzip openjdk-8-jdk
```

## 下载repo
```
sudo curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo
sudo chmod +x /usr/bin/repo
```
## 查找设备树
进入[___twrp___](https://twrp.me/Devices) 寻找自己的设备型号，点击进入
点击`Device Tree / files`进入设备树github地址
复制设备树github地址，稍后会用到
根据设备树的安卓版本同步对应的omni源码
比如下图中设备树源码的安卓版本为9.0，则同步9.0的omni源码，如果为8.1则同步8.1的omni源码
同步omni精简源码，-b为对应的安卓版本
```
mkdir omni
cd omni
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
repo sync -j8
```
## 更换aosp镜像地址

sudo vim ~/omni/.repo/manifest.xml

找到下面这句
```
fetch="https://android.googlesource.com"
将其更改为下面的其中一个：（自己视情况选择）

清华大学AOSP镜像地址：
fetch="https://aosp.tuna.tsinghua.edu.cn"

中国科学技术大学AOSP镜像地址：
fetch="git://mirrors.ustc.edu.cn/aosp"
```
可以使用-j参数多开下载进程，适当提高下载效率。
如有提示设置github邮箱和github用户名，请根据提示设置

## 同步完成后进入device创建机型型号,然后同步机型源码.
```
mkdir -p device/xiaomi
git clone https://github.com/TeamWin/android_device_xiaomi_sagit device/xiaomi/sagit
```
## 默认设置修改:
进入刚同步下来的`sagit`目录，打开`BoardConfig.mk`

默认亮度
TW_DEFAULT_BRIGHTNESS := 1843

默认语言
TW_DEFAULT_LANGUAGE := zh_CN

内核文件路径，如果内核在其他目录则需要修改，默认即可。
`TARGET_PREBUILT_KERNEL := device/xiaomi/sagit/prebuilt/Image.gz-dtb`

回到源码根目录，进入`bootable/recovery`
打开data.cpp

修改默认时区:
```
mPersist.SetValue(TW_TIME_ZONE_VAR, "CST6CDT,M3.2.0,M11.1.0");
修改为
mPersist.SetValue(TW_TIME_ZONE_VAR, "TAIST-8");

mPersist.SetValue(TW_TIME_ZONE_GUISEL, "CST6;CDT,M3.2.0,M11.1.0");
修改为
mPersist.SetValue(TW_TIME_ZONE_GUISEL, "TAIST-8;TAIDT");

mPersist.SetValue(TW_TIME_ZONE_GUIDST, "1");
修改为
mPersist.SetValue(TW_TIME_ZONE_GUIDST, "0");

默认24小时制:
mPersist.SetValue("tw_military_time", "0");
改为
mPersist.SetValue("tw_military_time", "1");

默认无震动:
mPersist.SetValue("tw_button_vibrate", "80");
mPersist.SetValue("tw_keyboard_vibrate", "40");
mPersist.SetValue("tw_action_vibrate", "160");
改为
mPersist.SetValue("tw_button_vibrate", "0");
mPersist.SetValue("tw_keyboard_vibrate", "0");
mPersist.SetValue("tw_action_vibrate", "0");

关闭屏幕超时:
mPersist.SetValue("tw_screen_timeout_secs", "60");
改为
mPersist.SetValue("tw_screen_timeout_secs", "0");

更多默认设置请自行发掘，基本都在这两个文件
```
## 配置ccache
ccache是一个缓存工具，它通过将编译产生的中间文件（预处理得到的代码、输出文件*.o等）缓存起来，待到下次编译同样源文件时直接复制而不是重新生成，以此来提高编译效率。最直接的好处，就是在make clean之后，重新编译的速度能够快不少。

在~/.bashrc的尾部加上以下语句，启用ccache。ccache默认存放在用户目录下（~/.ccache），可以更改环境变量CCACHE_DIR，以设置到其他磁盘分区。

###  启用ccache
export USE_CCACHE=1
###  改变ccache缓存路径
export CCACHE_DIR=~/.ccache

然后重启终端，或运行source ~/bashrc，使上述语句生效。
另外，可以设置ccache缓存所占磁盘空间的大小：

ccache -M 50G

## 回到源码根目录，准备编译
```
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh
lunch ##选择机型，eng后缀
```

## 开始编译
make recoveryimage

## 编译完成

目录在`out/target/product/<设备名>/recovery.img`复制出来刷入即可
默认编译的是官方最新版TWRP，如果需要编译橙狐，红狼之类的TWRP，请删除`bootable/recovery`，然后cd进bootable同步橙狐或红狼的TWRP源码，源码在xda发布帖会附带有，如果配套有设备树源码需要连`device/xiaomi/sagit`一起删除，然后再同步橙狐或红狼配套的设备树源码，注意设备树源码安卓版本要和omni安卓版本一致。

