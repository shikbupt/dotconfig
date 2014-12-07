

PWD=`pwd`

all : 
	make git
	make vim
	make system

git : 
	if [ -e ~/.gitconfig ]; then
		mv ~/.gitconfig ~/.gitconfig.old
	fi
	ln -s ${PWD}/git/gitconfig ~/.gitconfig


vim : 
	if [ -e ~/.vimrc ]; then
		mv ~/.vimrc ~/.vimrc.old
	fi
	ln -s ${PWD}/vim/vimrc ~/.vimrc
	git clone https://github.com/gmarik/Vundle.vim.git ${PWD}/vim/bundle/Vundle.vim
	echo 'install plugins ……' > tmp
	vim tmp -c "PluginInstall" -c "qall"
	rm tmp

system :
	if [ -e ~/.bashrc ]; then
		mv ~/.bashrc ~/.bashrc.old
	fi
	ln -s ${PWD}/system/bashrc ~/.bashrc



