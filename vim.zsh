#!/bin/zsh

# myconfへの保存
cp ~/.vimrc ~/.vim/myconf/.vimrc
cp ~/.gvimrc ~/.vim/myconf/.gvimrc
cp ~/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/mycolor.vim ~/.vim/myconf/mycolor.vim
cp ~/.vim/indent/* ~/.vim/myconf/
cp ~/.vim/snippets/* ~/.vim/myconf/


# 戦闘力の表示
echo "戦闘力"
wc -l ~/.vimrc

