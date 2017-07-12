"================================================================================
" 最初に実行するやつ
"================================================================================

" 自分のvimrc用のaugroupを作成
" 定義済みのautocmdを削除
augroup MyVimrc
  autocmd!
augroup END

"================================================================================
" Plugin
"================================================================================

source ~/.vim/rc/plugin.vim

"================================================================================
" 表示
"================================================================================

" 行番号
set number

" 文字コード
set encoding=utf-8

" タブ文字、行末など
set listchars=eol:$,tab:>-,trail:_
set list

" 色
set t_Co=256
syntax enable
set background=dark

" ハイライト
source ~/.vim/rc/highlight.vim

"================================================================================
" 入力
"================================================================================

" タブの代わりに空白文字を挿入
set expandtab

" タブ幅の設定
function! SetTabWidth(width)
  let &shiftwidth  = a:width
  let &tabstop     = a:width
  let &softtabstop = a:width
endfunction
call SetTabWidth(2)
command! -nargs=1 Setw call SetTabWidth(<args>)

set smartindent
set smarttab

" カッコなどを入力したら自動的に中へ
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap {% {%<Space><Space>%}<Left><Left><Left>
inoremap [] []<Left>

" 現在の行の下に空行
inoremap <C-o> <ESC>o

"================================================================================
" 移動
"================================================================================

" カーソルが行頭、行末で止まらないように
set whichwrap=b,s,h,l,<,>,[,]

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 表示行単位で移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 1文字のみの移動
inoremap <C-f><C-h> <Left>
inoremap <C-f><C-j> <Down>
inoremap <C-f><C-k> <Up>
inoremap <C-f><C-l> <Right>

" 一行スクロール
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

"================================================================================
" 検索
"================================================================================

" 文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 文字列に大文字が含まれている場合は区別して検索する
set smartcase

" ファイルの先頭へループしない
set nowrapscan

" インクリメンタルサーチを有効にする
set incsearch

" ハイライトをつける
set hlsearch

" ハイライト解除
nnoremap <silent><C-l> :nohlsearch<CR>

"================================================================================
" バックアップ
"================================================================================

" スワップ
set swapfile
set directory=~/.vim/.backup

" バックアップ
set backup
set backupdir=~/.vim/.backup

"================================================================================
" ステータスライン
"================================================================================

set laststatus=2
set cmdheight=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

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

"================================================================================
" Command-line Window
"================================================================================

" 行数
set cmdwinheight=4

" ::で起動
nmap ::  <sid>(command-line-enter)
xmap ::  <sid>(command-line-enter)
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

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

"================================================================================
" map
"================================================================================

" jjでノーマルモードへ
inoremap jj <Esc>
vnoremap <C-j><C-j> <Esc>

" <C-p>でpaste-modeとの切り替え
nnoremap <silent><C-p> :set paste!<CR>

" カーソルキーからABCDが出現する謎現象を解消
inoremap OA <Up>
inoremap OB <Down>
inoremap OC <Right>
inoremap OD <Left>
vnoremap OA <Up>
vnoremap OB <Down>
vnoremap OC <Right>
vnoremap OD <Left>

