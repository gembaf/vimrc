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

" required
call dein#add('Shougo/neocomplcache')

" base
call dein#add('itchyny/lightline.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

" snippet
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

"-- syntax
" js
call dein#add('mtscout6/vim-cjsx.git')
call dein#add('mxw/vim-jsx.git')
call dein#add('kchmck/vim-coffee-script.git')

" rails
call dein#add('tpope/vim-rails')

" template
call dein#add('slim-template/vim-slim.git')
call dein#add('groenewege/vim-less')
call dein#add('cakebaker/scss-syntax.vim')

" other
call dein#add('chase/vim-ansible-yaml')

call dein#end()

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on

source ~/.vim/rc/neosnippet.vim

