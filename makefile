

PWD=`pwd`

all : 
	make vim
	make system

.PHONY: vim
vim : 
	sed -i -e "s,set rtp+=.*$,set rtp+=`pwd`/vim/bundle/Vundle.vim,g" ./vim/vimrc-plugin
	sed -i -e "s,call vundle#begin.*$,call vundle#begin('`pwd`/vim/bundle'),g" ./vim/vimrc-plugin
	sed -i -e "\$s,.*,source `pwd`/vim/vimrc-plugin,g" ./vim/vimrc
	if [ -e ~/.vimrc ]; then  \
		mv ~/.vimrc ~/.vimrc.old;  \
	fi
	if [ -e ${PWD}/vim/bundle ]; then  \
		rm -rf ${PWD}/vim/bundle;   \
	fi
	ln -s ${PWD}/vim/vimrc ~/.vimrc
	git clone https://github.com/gmarik/Vundle.vim.git ${PWD}/vim/bundle/Vundle.vim
	echo 'install plugins ……' > tmp
	vi tmp -c "PluginInstall" -c "qall"
	rm tmp

.PHONY: system
system :
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"	




