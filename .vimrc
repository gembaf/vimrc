"===========================================================
" 初期設定
"===========================================================

" tinyとsmallではvimrcを読み込まない
if !1 | finish | end

" Vimrc augroup
autocmd!
augroup MyVimrc
  autocmd!
augroup END

command! -nargs=* Autocmd autocmd MyVimrc <args>
command! -nargs=* AutocmdFT autocmd MyVimrc FileType <args>

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

" 256色使えるように
set t_Co=256

" 行番号
set number

" 行番号の相対表記
set relativenumber
nnoremap <F4> :<C-u>set relativenumber!<CR>

" viとの互換性をOFF
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

" 全角スペースの視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

" タブ文字、行末など不可視文字を表示する
set list

" listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>-,trail:_

" ステータスライン
set laststatus=2
set cmdheight=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
highlight StatusLine ctermfg=black ctermbg=cyan

" ノーマルモード後にすぐ反映されない対策
if has('unix') && !has('gui_running')
  inoremap <silent> <ESC> <ESC>
  vnoremap <silent> <ESC> <ESC>
endif

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

" ::でCommand-line windowへ
nmap ::  <sid>(command-line-enter)
xmap ::  <sid>(command-line-enter)

autocmd MyVimrc CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
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

" 1文字のみの移動
inoremap <C-f><C-h> <Left>
inoremap <C-f><C-j> <Down>
inoremap <C-f><C-k> <Up>
inoremap <C-f><C-l> <Right>

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

" <C-p>でpaste-modeとの切り替え
nnoremap <silent><C-p> :set paste!<CR>

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
" Color
"===========================================================

" 背景色の設定
set background=dark

" コメント
hi Comment ctermfg=green ctermbg=NONE guifg=green guibg=NONE

" 文字列
hi String ctermfg=grey ctermbg=NONE guifg=grey guibg=NONE

" 数字
hi Number ctermfg=lightred ctermbg=NONE guifg=lightred guibg=NONE

" 行番号
hi LineNr ctermfg=blue ctermbg=NONE guifg=blue guibg=NONE

" true, falseなど
hi Constant ctermfg=magenta ctermbg=NONE guifg=magenta guibg=NONE

" ブール型
hi Boolean ctermfg=magenta ctermbg=NONE guifg=magenta guibg=NONE

" テキスト以外 (eol, extends, precedes)
hi NonText ctermfg=lightblue ctermbg=NONE guifg=lightblue guibg=NONE

" スペシャルキー (nbsp, tab, trail)
hi SpecialKey ctermfg=darkblue ctermbg=NONE guifg=blue guibg=NONE

" 補完時のメニュー
hi Pmenu ctermfg=white ctermbg=darkblue guifg=white guibg=blue
hi PmenuSel ctermfg=white ctermbg=darkred guifg=white guibg=red

" マクロなど
hi PreProc ctermfg=cyan ctermbg=NONE guifg=cyan guibg=NONE

