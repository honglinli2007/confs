#!/bin/bash

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ -z $(find ${XDG_DATA_HOME:-$HOME/.local/share}/nvim -name plug.vim) ]
then
	cp ./plug.vim ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim
fi

mkdir -p ~/.config/nvim/ || true
ln -s $(readlink -f init.vim) ~/.config/nvim/init.vim > /dev/null 2>&1|| echo ~/.config/nvim/init.vim exists
echo Now please run PluginInstall in vim

