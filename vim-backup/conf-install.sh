#!/bin/bash

mkdir -p ~/.config/nvim/ || true
ln -s $(readlink -f init.vim) ~/.config/nvim/init.vim
