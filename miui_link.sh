#!/bin/sh

hugobasedirectory="cd xxxx"
pwd="pwd"
echo "\033[34m\033[01m\n	=======================	\033[0m"
echo "\033[32m\033[01m\n	MIUI地址上传	\n\033[0m"
echo "\033[34m\033[01m\n	=======================	\033[0m"
read -p "	请输入链接: " miui_link
echo $miui_link >> xxxx/content/posts/picasso_rom.md && sleep 2
echo "\033[32m\033[01m\n	输出完成\033[0m" && sleep 2
sleep 2 && echo "\033[32m\033[01m	进入hugo文件夹	\033[0m" && cd xxxx
pwd
sleep 2 && pwd && echo "\033[32m\033[01m	生成hugo	\033[0m"
hugo
sleep 1 && echo "\033[32m\033[01m	进入生成文件夹	\033[0m" &&  cd public
pwd
sleep 2 && echo "\033[32m\033[01m	推送到gitee&github	\033[0m" 
git add .
git commit -m "update"
sleep 1
git push
echo "\033[32m\033[01m	推送完成	\033[0m"


