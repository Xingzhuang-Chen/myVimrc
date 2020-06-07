PWD:=$(shell pwd)
bulid:vimrc vim 
	@#echo $(PWD)
	ln -s $(PWD)/vim ~/.vim
	ln -s $(PWD)/vimrc ~/.vimrc
	vim +PluginInstall +qall
	@echo done!
