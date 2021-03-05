#! /bin/bash

tar xf tmux-3.1b.tar.gz
cd tmux-3.1b
./configure --prefix=/opt/tmux
make
make install
cd ..
rm -rf tmux-3.1b
