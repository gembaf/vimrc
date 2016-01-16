#!/bin/bash

git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/.bundle/neobundle.vim
vim +":NeoBundleInstall" +":q"
cp -i <(echo 'source ~/.vim/.vimrc') ~/.vimrc

