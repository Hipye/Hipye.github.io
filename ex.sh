#!/bin/sh
dateex=$(date +%Y.%m.%d)
echo "\n 查看本地 \n"
sleep 2
ls openwrt*
sleep 2
mkdir -p /www/wwwroot/nova.omoe.cc/mirror/openwrt/${dateex}
echo "生成文件夹" && sleep 2
rclone sync openwrt-lean-dl-${dateex}/tar.gz moriz:backups/openwrt/${dateex}/
sleep 2
rclone sync openwrt-lean-luci-app-${dateex}/tar.gz moriz:backups/openwrt/${dateex}/
sleep 2
rclone sync openwrt-p2w-r619ac-${dateex}.tar.gz moriz:backups/openwrt/${dateex}/
echo "\n 推送完成 \n"

