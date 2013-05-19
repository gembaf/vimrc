#!/bin/zsh

# myconfへの保存
cp -u ~/.vimrc ~/.vim/myconf/.vimrc
cp -u ~/.gvimrc ~/.vim/myconf/.gvimrc
cp -u ~/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/mycolor.vim ~/.vim/myconf/mycolor.vim
cp -u ~/.vim/indent/* ~/.vim/myconf/
cp -u ~/.vim/snippets/* ~/.vim/myconf/
cp -u ~/.vim/dict/* ~/.vim/myconf/


# 戦闘力の表示
echo "戦闘力"
wc -l ~/.vimrc

