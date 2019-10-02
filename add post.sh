#!/bin/sh
hexo clean
hexo g && gulp
touch public/CNAME
echo "hipye.top" > public/CNAME
hexo d
