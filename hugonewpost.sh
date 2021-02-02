#!/bin/sh
esc=\033
mid=\033[01m
  blackf="${esc}[30m";   redf="${esc}[31m";    greenf="${esc}[32m"
  yellowf="${esc}[33m"   bluef="${esc}[34m";   purplef="${esc}[35m"
  cyanf="${esc}[36m";    whitef="${esc}[37m"                                                                                                              blackb="${esc}[40m";   redb="${esc}[41m";    greenb="${esc}[42m"
  yellowb="${esc}[43m"   blueb="${esc}[44m";   purpleb="${esc}[45m"
  cyanb="${esc}[46m";    whiteb="${esc}[47m"

  boldon="${esc}[1m";    boldoff="${esc}[22m"
  italicson="${esc}[3m"; italicsoff="${esc}[23m"
  ulon="${esc}[4m";      uloff="${esc}[24m"
  invon="${esc}[7m";     invoff="${esc}[27m"
                                                                        
  reset="${esc}\033[0m"
basedirectory=/mnt/sdcard/Documents/PureWriter
hugodirectory=~/xxxx
hugogeneral=~/xxxx/content/posts

echo "\033[34m\033[01m	=======================\033[0m"
echo "\033[33m\033[01m	键入博客文件名\033[0m"
read -p "	" newpost && sleep 2
echo "\033[34m\033[01m	生成文件\033[0m" && sleep 1
cd ${hugodirectory} && pwd && sleep 1
rm ${newpost}.md && echo "\033[32m033[01m	基础设定\033[0m"
hugo new ${hugogeneral}/${newpost}.md
sleep 1
hugo new ${hugogeneral}/${newpost}-.md
sleep 5 && cd
echo "\033[34m\033[01m	写入文件\033[0m"
sleep 1
cd ${basedirectory}
sleep 1
pwd
mv ${newpost}.md ~/
sleep 1
cd
rm -rf ${hugogeneral}/${newpost}-.md
cat ${hugogeneral}/${newpost}.md ${newpost}.md>${hugogeneral}/${newpost}-.md
sleep 1
rm -rf ${hugogeneral}/${newpost}.md
sleep 1 && echo "\033[34m\033[01m	修改.md为可部署状态\033[0m"
sed  -i '4s/draft: true/draft: false/g' ${hugogeneral}/${newpost}-.md 
cd xxxx && hugo && sleep 3
cd public && pwd
echo "\033[34m\033[01m	推送\033[0m" && sleep 1
git add .
git commit -m "update"
git push && sleep 2
echo "\033[34m\033[01m	ok bye\033[0m" && sleep 2
echo "\033[34m\033[01m	=======================\033[0m"


