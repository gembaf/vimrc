#!/bin/sh

# .vimrc と 一応.gvimrc の移動
cp ~/.vim/myconf/.vimrc ~/
cp ~/.vim/myconf/.gvimrc ~/

# vim-powerline 用の色設定の移動
cp ~/.vim/myconf/color_powerline.vim ~/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/

