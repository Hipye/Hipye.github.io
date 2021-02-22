# Linuxdepoly自用命令合集


linuxdepoly自用命令合集
## 基础软件安装
```bash
apt install fish screen git wget nload htop fuse p7zip-full dh-make dpkg-dev debhelper fakeroot build-essential mariadb-server rclone vim -y 
```
---
## 编译
```bash
wget https://github.com/aria2/aria2/releases/download/release-1.35.0/aria2-1.35.0.tar.gz
wget https://github.com/cloudreve/Cloudreve/releases/download/3.2.1/cloudreve_3.2.1_linux_arm64.tar.gz
```
## 添加开机自启脚本
---

```bash
linux系统/etc/init.d目录下的开机自启脚本
1.复制或软连接脚本到/etc/init.d/目录下

2.脚本内容如下，加粗内容是模板性注释，不能更改。

$cat /etc/init.d/test.sh

#!/bin/bash

### BEGIN INIT INFO

# Provides:          test.sh        //test.sh是自己创建的脚本名称

# Required-Start:    $local_fs $network $remote_fs $syslog

# Required-Stop:     $local_fs $network $remote_fs $syslog

# Default-Start:     2 3 4 5

# Default-Stop:      0 1 6

# Short-Description: starts the test.sh daemon      //test.sh是自己创建的脚本名称

# Description:       starts test.sh using start-stop-daemon     //test.sh是自己创建的脚本名称

### END INIT INFO

sudo cp /media/share/frp_0.27.0_linux_amd64.tar.gz /opt/        //开机后需要执行的命令

3.赋权限给脚本文件

$sudo chmod 755 /etc/init.d/test.sh

4.加入开机启动
```bash
sudo update-rc.d test.sh defaults 90
```

5.重启验证

结束
查看脚本自启
ll   /etc/init.d

## 开启nginx目录展示
---
```conf
【Nginx】Nginx打开目录浏览功能(autoindex) 转载

Nginx默认是不允许列出整个目录的。如需此功能，打开nginx.conf文件或你要启用目录浏览虚拟主机的配置文件，在server或location 段里添加上autoindex on;来启用目录流量，下面会分情况进行说明。

另外Nginx的目录流量有两个比较有用的参数，可以根据自己的需求添加：

配置	说明
autoindex_exact_size	默认为 on，显示出文件的确切大小，单位是bytes。
改为 off 后，显示出文件的大概大小，单位是kB或者MB或者GB
autoindex_localtime	默认为off，显示的文件时间为GMT时间。
改为on后，显示的文件时间为文件的服务器时间
1. 整个虚拟主机开启目录流量
在server段添加

location / {
    autoindex on;
    autoindex_localtime on; 
}

2. 单独目录开启目录流量
2.1 直接二级目录开启目录流量
location /down/ {
    autoindex on;
}

2.2 虚拟目录开启目录流量
location /down/ {
    alias /home/wwwroot/lnmp/test/;
    autoindex on;
}
```
