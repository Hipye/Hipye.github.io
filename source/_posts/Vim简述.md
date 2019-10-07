---
title: vim使用简述
tags:
  - linux
  - Vim
categories: 习惯
abbrlink: 1230
date: 2019-04-23 01:20:20
---

> 习惯使用linux系统的人，一定会调制一个得心应手的编辑器比如本人之前一直在用nano[[1]](https://it.m.wikipedia.org/wiki/Nano_editor)或如Vim[[2]](https://it.m.wikipedia.org/wiki/Vim_editor_di_testo)由于nano的局限性虽然易上手本人只好转而去熟悉vim编辑器。虽然vim的的操作性可以吹爆`linux or unix or windows三平台通用`，但是另一方面也增加了其难于上手的门槛😲
---
<!--more-->


## 安装Vim
```
sudo apt -y update && upgrade && vim
```
## Vim的操作模式
vim我现在所用到不外乎两个模式
一个是**查看**
```
vim {文本文件}
```
另一个则是**编辑**
`键入 i 变成输入模式`

## Vim快捷操作


vim一般操作所用到的键位如下
```
Esc    # 切换模式
:		   # 和esc配合
q 		 # 退出 
q! 	 	 # 强行退出
wq	 	 # 保存后退出
**以上几个键位都必须执行 Esc + : **
/	 	   # 搜索关键字
n 	 	 # 搜索完之后加则跳到下一个关键字
gg	 	 # 跳到首行起始位置
行数gg  # 跳到指定行数
G	 	   # 跳到尾行首个光标位置
行数dd	 # 剪切指定行数内容 并删除空隙
p	 	   # 小写字母 将缓存区的内容粘贴到光标的后面
P	 	   # 大写字母 将内容粘贴到光标的前面
yy	 	 # 复制当前行到内存缓存区
行数yy  # 复制指定行数内容到内存缓存区
u	 	   # 撤消前一条命令的结果
.      # 重复最后一条修改正文的命令
i      # 在光标左侧插入正文
a      # 在光标右侧插入正文
o      # 在光标所在行的下一行增添新行
O      # 在光标所在行的上一行增添新行
I      # 在光标所在行的开头插入
A      # 在光标所在行的末尾插入
```

## 自定义.vimrc配置文件
### debian的系统的vim配置文件在/etc/vim下且.vimrc不存在只有vimrc和vimrc.local两个文件故使用source vimrc.local使配置文件生效

```
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  " 这样设置可以让vim不会出现中文乱码
set termencoding=utf-8
set encoding=utf-8
set shortmess=atI  " 启动的时候不显示那个援助乌干达儿童的提示 
winpos 5 5         " 设定窗口位置 
set lines=30 columns=85    " 设定窗口大小 
set nu             " 显示行号 
set go=            " 不要图形按钮 
"color asmanian2   " 设置背景主题 
set guifont=Courier_New:h10:cANSI   " 设置字体 
syntax on          " 语法高亮 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'godlygeek/tabular'		" 基础
" Plugin 'plasticboy/vim-markdown'	" 这是我写markdown所需的插件
Plugin 'suan/vim-instant-markdown'
```
## 配置vim插件
## Doc
[[Vimdoc]](http://vimdoc.sourceforge.net/)
[[VimWiKi && berlinix.com]](http://www.berlinix.com/vim/VimWiki.php)
## 参考链接
[[JianShu && 甲鱼]](https://www.jianshu.com/p/bcbe916f97e1)
