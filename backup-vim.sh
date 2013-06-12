#!/bin/sh

# myconfへの保存
cp -u ~/.vimrc ~/.vim/myconf/.vimrc
cp -u ~/.gvimrc ~/.vim/myconf/.gvimrc
cp -u ~/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/color_powerline.vim ~/.vim/myconf/color_powerline.vim
cp -u ~/.vim/indent/* ~/.vim/myconf/
cp -u ~/.vim/snippets/* ~/.vim/myconf/
cp -u ~/.vim/dict/* ~/.vim/myconf/


# 戦闘力の表示
echo "戦闘力"
wc -l ~/.vimrc

