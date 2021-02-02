#!/bin/sh
read -p "       请输入链接: " commit
git add .
git commit -m "${commit}"
git push
