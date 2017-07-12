"================================================================================
" Plugin
"================================================================================

filetype plugin indent off

" deinパス設定
let s:dein_dir = fnamemodify('~/.vim/.dein/', ':p')
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

" dein.vim本体の存在チェックとインストール
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

if &runtimepath !~# '/dein.vim'
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

call dein#begin(s:dein_dir)

call dein#add('Shougo/neocomplcache') " required
call dein#add('itchyny/lightline.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

call dein#end()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on

source ~/.vim/rc/neosnippet.vim

