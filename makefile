

PWD=`pwd`

all : 
	make git
	make vim
	make system

.PHONY: git
git : 
	if [ -e ~/.gitconfig ]; then   \
		mv ~/.gitconfig ~/.gitconfig.old;  \
	fi
	ln -s ${PWD}/git/gitconfig ~/.gitconfig

.PHONY: vim
vim : 
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
	if [ -e ~/.bashrc ]; then  \
		mv ~/.bashrc ~/.bashrc.old;  \
	fi
	ln -s ${PWD}/system/bashrc ~/.bashrc



