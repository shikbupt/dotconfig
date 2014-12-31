

PWD=`pwd`

all : 
	make git
	make vim
	make system

.PHONY: git
git : 
	grep -ril root_to_install ./git/* | xargs sed -i "s,ROOT_TO_INSTALL,`pwd`,g"
	if [ -e ~/.gitconfig ]; then   \
		mv ~/.gitconfig ~/.gitconfig.old;  \
	fi
	ln -s ${PWD}/git/gitconfig ~/.gitconfig

.PHONY: vim
vim : 
	grep -ril root_to_install ./vim/* | xargs sed -i "s,ROOT_TO_INSTALL,`pwd`,g"
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
	grep -ril root_to_install ./system/* | xargs sed -i "s,ROOT_TO_INSTALL,`pwd`,g"
	if [ -e ~/.bashrc ]; then  \
		echo "source ${PWD}/system/bashrc" >> ~/.bashrc; \
	else\
		ln -s ${PWD}/system/bashrc ~/.bashrc;  \
	fi




