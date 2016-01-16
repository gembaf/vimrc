"===========================================================
" 初期設定
"===========================================================

" 絶対最初に書く!!!
autocmd!
" 絶対最初に書く!!!

let mapleader='\'

" Windows環境判別用変数
let s:is_windows = has('win32') || has('win64')

" Kaoriya版プラグインの無効化
if has('kaoriya')
  " autodate.vim
  let plugin_autodate_disable = 1
  " cmdex.vim
  let plugin_cmdex_disable = 1
  " dicwin.vim
  let plugin_dicwin_disable = 1
  " format.vim
  let plugin_format_disable = 1
  " hz_ja.vim
  let plugin_hz_ja_disable = 1
  " scrnmode.vim
  let plugin_scrnmode_disable = 1
  " verifyenc.vim
  let plugin_verifyenc_disable = 1
endif

"===========================================================
" plugin
"===========================================================

source ~/.vim/myconf/plugin.vim

"===========================================================
" 基本設定
"===========================================================

" autocmd!をMyAutoCmdに追加
augroup MyAutoCmd
  autocmd!
augroup END

" 256色使えるように
set t_Co=256

" 行番号をつける
set number

" viとの互換性をOFF
" OFFにするとなぜかwhichwrapが効かなくなる
" whichwrapより前に書くと解決
set nocompatible

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 少し賢いBackSpace
set backspace=indent,eol,start

" 色をつける
syntax enable

" 表示行単位で移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 文字コード指定
set encoding=utf-8
if !s:is_windows
  set fileencoding=utf-8
else
  set fileencoding=sjis
endif

" :next :previous などのコマンドを実行する度に保存
set autowrite

" <C-p>でpaste-modeとの切り替え
nnoremap <silent><C-p> :set paste!<CR>

" 折りたたみ
set foldmethod=marker
set foldlevel=1

" 行番号を相対的に
set relativenumber
nnoremap <F4> :<C-u>set relativenumber!<CR>

"===========================================================
" indent, tab
"===========================================================

" タブの代わりに空白文字を挿入する
set expandtab

" タブ幅の設定
function! SetTabWidth(width)
  let &shiftwidth  = a:width
  let &tabstop     = a:width
  let &softtabstop = a:width
endfunction
call SetTabWidth(2)
command! -nargs=1 Setw call SetTabWidth(<args>)

" 自動インデント
set autoindent

" スマートインデント
set smartindent

" スマートタブ
set smarttab

"===========================================================
" Backup
"===========================================================

if !s:is_windows  " Linuxのとき
  " スワップファイルを作る
  set swapfile
  " バックアップファイルを作る
  set backup
  " スワップファイルの出力先を指定
  set directory=~/.vim/.backup
  " バックアップファイルの出力先を指定
  set backupdir=~/.vim/.backup
else              " Windowsのとき
  " スワップファイルをつくらない
  set noswapfile
  " バックアップを作らない
  set nobackup
endif

"===========================================================
" Search
"===========================================================

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索をファイルの先頭へループしない
set nowrapscan

" インクリメンタルサーチを有効
" 検索ワードの最初の文字を入力した時点から検索開始
set incsearch

" ハイライト検索
set hlsearch

" 検索時のハイライトを解除
nnoremap <silent><C-l> :nohlsearch<CR>

"===========================================================
" Command-line Window
"===========================================================

" Command-line windowの行数
set cmdwinheight=4

nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

nmap ::  <sid>(command-line-enter)
xmap ::  <sid>(command-line-enter)

autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  " Command-line windowで補完を開始する長さ
  " NeoComplCacheAutoCompletionLength 2

  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction

"===========================================================
" Window
"===========================================================

" 新しいタブの作成
nnoremap <C-t><C-e> :<C-u>tabedit<Space>

" Tabでウィンドウの移動
nnoremap <silent><Tab> <C-w>w

" 分割したウィンドウ幅の変更
nnoremap <C-w><C-u> <C-w>+
nnoremap <C-w><C-d> <C-w>-

"===========================================================
" Keybind
"===========================================================

" jjでノーマルモードへ
inoremap jj <Esc>
vnoremap <C-j><C-j> <Esc>

" 一行スクロールをエイリアス
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" カーソルキーからABCDが出現する謎現象を解消
inoremap OA <Up>
inoremap OB <Down>
inoremap OC <Right>
inoremap OD <Left>
vnoremap OA <Up>
vnoremap OB <Down>
vnoremap OC <Right>
vnoremap OD <Left>

" 1文字のみの移動はこれで
inoremap <C-f><C-h> <Left>
inoremap <C-f><C-j> <Down>
inoremap <C-f><C-k> <Up>
inoremap <C-f><C-l> <Right>

" バックスペースとデリートキーをエイリアス
" inoremap <C-u> <BS>
inoremap <C-d> <Del>

" 現在の行の下に空行
inoremap <C-o> <ESC>o

" カッコなどを入力したら自動的に中へ
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap {% {%<Space><Space>%}<Left><Left><Left>
inoremap [] []<Left>

" zはよく使うのでSpaceで
nnoremap <Space> z
vnoremap <Space> z
nnoremap <Space><Space> zz

" }}}

"===========================================================
" 視覚化
"===========================================================

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" タブ文字、行末など不可視文字を表示する
set list

" listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>-,trail:_

" ステータスラインを常に表示
set laststatus=2

" ステータスラインを2行
set cmdheight=2

" ステータスラインに色々表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" ノーマルモード後にすぐ反映されない対策
if has('unix') && !has('gui_running')
  inoremap <silent> <ESC> <ESC>
  vnoremap <silent> <ESC> <ESC>
endif

" ステータスラインの色を変更(ノーマルモード時)
highlight StatusLine ctermfg=black ctermbg=cyan

"===========================================================
" Statusline
"===========================================================

" pluginが効かない時用

let g:hi_insert = 'highlight StatusLine ctermfg=red ctermbg=yellow cterm=NONE guifg=red guibg=yellow'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''

function! s:StatusLine(mode)
    if a:mode == 'Enter'
      silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
      silent exec g:hi_insert
    else
      highlight clear StatusLine
      silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

"===========================================================
" 戦闘力を上げるために
"===========================================================

" '\e[v|g]'で.(g)vimrcを編集
nnoremap <silent><Leader>ev  :<C-u>edit $MYVIMRC<CR> :echo "Opened .vimrc"<CR>
nnoremap <silent><Leader>eg  :<C-u>edit $MYGVIMRC<CR> :echo "Opened .gvimrc"<CR>

" '\r[v|g]'で.(g)vimrcを再読み込み
nnoremap <silent><Leader>rv :<C-u>source $MYVIMRC<CR> :echo "Finish Loading .vimrc"<CR>
nnoremap <silent><Leader>rg :<C-u>source $MYGVIMRC<CR> :echo "Finish Loading .vimrc"<CR>

"if !has('gui_running') && !s:is_windows "Windowsの場合
"  ".vimrcの再読込時にも色が変化するようにする
"  autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
"else
"  ".vimrcの再読込時にも色が変化するようにする
"  autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC
"  autocmd MyAutoCmd BufWritePost $MYGVIMRC
"endif

"===========================================================
" Color
"===========================================================

source ~/.vim/myconf/color.vim

