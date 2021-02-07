#!/bin/sh
cd && sleep 2
read -p "       请输入链接: " rclone
rclone sync ${rclone} moriz:backups
