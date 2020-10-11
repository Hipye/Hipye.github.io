
		echo "正在安装vim..."
		apt update
		apt install -y vim
		#安装vim-python
		while true
		do
			read -p "你要安装vim-python（Vim的Python插件）吗？ [Y/n] " input
			case $input in
				[yY][eE][sS]|[yY])
					echo "正在安装vim-python..."
					apt install -y vim-python
					break;;
				[nN][oO]|[nN])
					break;;
				*)
					echo "输入错误，请重新输入...";;
			esac
		done
		
		#安装SpaceVim
		while true
		do
			read -p "你要安装SpaceVim（模块化的 Vim IDE）吗？ [Y/n] " input
			case $input in
				[yY][eE][sS]|[yY])
					echo "正在安装SpaceVim..."
					curl -sLf https://spacevim.org/cn/install.sh | bash
					break;;
				[nN][oO]|[nN])
					break;;
				*)
					echo "输入错误，请重新输入...";;
			esac
		done
		echo "Vim插件安装完成..."
	elif [ "${OPTION}" == '2' ]; then
		echo "正在安装Python..."
		apt update
		apt install -y python
		#换pip源，更新pip
		while true
		do
			read -p "你要切换Pypi源为清华源吗？ [Y/n] " input
			case $input in
				[yY][eE][sS]|[yY])
					echo "正在更新pip..."
					pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
					pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
					break;;
				[nN][oO]|[nN])
