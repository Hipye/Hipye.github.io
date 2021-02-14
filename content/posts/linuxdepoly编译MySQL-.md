---
title: "Linuxdepoly编译MySQL"
date: 2021-02-04T04:52:52Z
draft: false
---

首先使用service mysql start 启动mysql服务，然后在终端执行

```
usermod -aG aid_inet mysql
```
然后开始设置初始密码等，执行
```bash
mysql_secure_installation
```

<font color="red">ERROR 2002 (HY000): Can't connect to MySQL server on</font>
`默认的配置文件地址`

```bash
vim /etc/mysql/mariadb.conf.d/50-server.cnf
```
```bash
# 修改为你本机的地址
bind-address            = x.x.x.x
```


<font color="red">ERROR 1130 (HY000): Host '192.168.x.x' is not allowed to connect to this MariaDB server</font>

```mysql
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'morizen' WITH GRANT OPTION;
flush privileges; 
```
表示授权某个用户在哪些主机上可以对哪些数据库和表进行哪些操作。

ON *.* db.table: 数据库和数据表
TO user: 要授权的用户
@ host: %’表示任何主机
参考
http://blog.csdn.net/leroy008/article/details/16116847
