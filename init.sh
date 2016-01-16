#!/bin/sh

# 設定の適用
echo 'source ~/.vim/.vimrc' > ~/.vimrc

# vim-powerline 用の色設定の移動
cp ~/.vim/myconf/color_powerline.vim ~/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/

