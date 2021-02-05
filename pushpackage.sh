#!/bin/bash
dateex=$(date +%Y.%m.%d)
echo "\n删除历史文件\n" && sleep 2
rm -rf *.tar.gz
sleep 2
echo "\n开始进入文件目录\n"
sleep 2
cd lede/ && pwd
sleep 2
echo "\n开始打包dl文件夹\n"
sleep 2
time tar zcvf openwrt-lean-dl-${dateex}.tar.gz dl/
echo "\n打包完成\n" && sleep 2
echo "\n开始打包 package/lean/\n"
time tar zcvf openwrt-lean-luci-app-${dateex}.tar.gz package/lean/
echo "\n打包完成\n" && sleep 2
echo "\n开始打包 bin/targets/ipq40xx/generic/\n"
time tar zcvf openwrt-p2w-r619ac-${dateex}.tar.gz bin/targets/ipq40xx/generic/
echo "\n打包完成\n" && sleep 2
echo "\n推送到localhost\n" && sleep 2
scp openwrt-lean-dl-${dateex}.tar.gz root@192.168.8.234:~
scp openwrt-lean-luci-app-${dateex}.tar.gz root@192.168.8.234:~
scp openwrt-p2w-r619ac-${dateex}.tar.gz root@192.168.8.234:~
echo "\n推送完成\n"
