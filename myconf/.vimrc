"=====================================================================
" 初期設定
"=====================================================================

"絶対最初に書く!!!
autocmd!
"絶対最初に書く!!!

let mapleader='\'

"Windows環境判別用変数
let s:is_windows = has('win32') || has('win64')

"Kaoriya版プラグインの無効化
if has('kaoriya')
    "autodate.vim
    let plugin_autodate_disable = 1
    "cmdex.vim
    let plugin_cmdex_disable = 1
    "dicwin.vim
    let plugin_dicwin_disable = 1
    "format.vim
    let plugin_format_disable = 1
    "hz_ja.vim
    let plugin_hz_ja_disable = 1
    "scrnmode.vim
    let plugin_scrnmode_disable = 1
    "verifyenc.vim
    let plugin_verifyenc_disable = 1
endif

"=====================================================================
" plugin
"=====================================================================
source ~/.vim/myconf/plugin.vim

"======================================================================
" 基本的な設定
"======================================================================

"autocmd!をMyAutoCmdに追加
augroup MyAutoCmd
  autocmd!
augroup END

"256色使えるように
set t_Co=256

"行番号をつける
set number

"viとの互換性をOFF
"OFFにするとなぜかwhichwrapが効かなくなる
"whichwrapより前に書くと解決
set nocompatible

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"少し賢いBackSpace
set backspace=indent,eol,start

"色をつける
syntax enable

" 表示行単位で移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"文字コード指定
set encoding=utf-8
if !s:is_windows
  set fileencoding=utf-8
else
  set fileencoding=sjis
endif

" :next :previous などのコマンドを実行する度に保存
set autowrite

"<C-p>でpaste-modeとの切り替え
nnoremap <silent><C-p> :set paste!<CR>

"===========================================================
" 言語別の設定
"===========================================================

"C言語: ~/.vim/indent/c.vim

"===========================================================
" indent, tab
"===========================================================

"タブの代わりに空白文字を挿入する
set expandtab

"タブ幅の設定
set shiftwidth=4
set tabstop=4
set softtabstop=4

"自動インデント
set autoindent

"スマートインデント
set smartindent

"スマートタブ
set smarttab

"===========================================================
" swap, backup file
"===========================================================

if !s:is_windows  "Linuxのとき
  "スワップファイルを作る
  set swapfile
  "バックアップファイルを作る
  set backup
  "スワップファイルの出力先を指定
  set directory=~/.vim/_tmp
  "バックアップファイルの出力先を指定
  set backupdir=~/.vim/_tmp
else              "Windowsのとき
  "スワップファイルをつくらない
  set noswapfile
  "バックアップを作らない
  set nobackup
endif


"===========================================================
" search
"===========================================================

"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

"検索をファイルの先頭へループしない
set nowrapscan

"インクリメンタルサーチを有効
"検索ワードの最初の文字を入力した時点から検索開始
set incsearch

"ハイライト検索
set hlsearch

"=====================================================================
" Command-line Window
"=====================================================================

"Command-line windowの行数
set cmdwinheight=4

nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

nmap ::  <sid>(command-line-enter)
xmap ::  <sid>(command-line-enter)

autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
function! s:init_cmdwin()
  "Command-line windowで補完を開始する長さ
  "NeoComplCacheAutoCompletionLength 2

  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"

  "Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  startinsert!
endfunction

"======================================================================
" 戦闘力を上げるために
"======================================================================

"'\e[v|g]'で.(g)vimrcを編集
nnoremap <silent><Leader>ev  :<C-u>edit $MYVIMRC<CR> :echo "Opened .vimrc"<CR>
nnoremap <silent><Leader>eg  :<C-u>edit $MYGVIMRC<CR> :echo "Opened .gvimrc"<CR>

"'\r[v|g]'で.(g)vimrcを再読み込み
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


"=====================================================================
" keybind
"=====================================================================

"Ctrl+pでノーマルモードへ
"inoremap <C-p> <ESC>

"jjでノーマルモードへ
inoremap jj <Esc>
vnoremap <C-j><C-j> <Esc>

"インサートモード時に移動
"これは甘え
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

"1文字のみの移動はこれで
inoremap <C-f><C-h> <Left>
inoremap <C-f><C-j> <Down>
inoremap <C-f><C-k> <Up>
inoremap <C-f><C-l> <Right>

"バックスペースとデリートキーをエイリアス
"inoremap <C-u> <BS>
inoremap <C-d> <Del>

"行の先頭へ移動
inoremap <C-a> <HOME>

"行の後ろへ移動
inoremap <C-e> <END>

"現在の行の下に空行
inoremap <C-o> <ESC>o

"Tabでウィンドウの移動
nnoremap <silent><Tab> <C-w>w

"カッコなどを入力したら自動的に中へ
inoremap {} {}<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap {% {%<Space><Space>%}<Left><Left><Left>
inoremap [] []<Left>

"ノーマルモード時にwで保存
"nnoremap w :<C-u>w<Return>

" 検索時のハイライトを解除
nnoremap <silent><C-l> :nohlsearch<CR>

"=====================================================================
" 視覚化、表示など
"=====================================================================

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"タブ文字、行末など不可視文字を表示する
set list

"listで表示される文字のフォーマットを指定する
set listchars=eol:\\,tab:>-,trail:_

"ステータスラインを常に表示
set laststatus=2

"ステータスラインを2行
set cmdheight=2

"ステータスラインに色々表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"ノーマルモード後にすぐ反映されない対策
if has('unix') && !has('gui_running')
  inoremap <silent> <ESC> <ESC>
  vnoremap <silent> <ESC> <ESC>
endif

" ステータスラインの色を変更(ノーマルモード時)
highlight StatusLine ctermfg=black ctermbg=cyan

"カーソル行をハイライト
"set cursorline


"=================================================
" インサートモード時に、ステータスラインの色を変更
" Windowsのときのみ
"=================================================
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


"=====================================================================
" color
"=====================================================================

"背景色をVimに教えることで、見やすい色が設定される
set background=dark

"コメント
hi Comment ctermfg=darkgreen ctermbg=NONE guifg=darkgreen guibg=NONE

"文字列
hi String ctermfg=grey ctermbg=NONE guifg=grey guibg=NONE

"数字
hi Number ctermfg=lightred ctermbg=NONE guifg=lightred guibg=NONE

"行番号
hi LineNr ctermfg=blue ctermbg=NONE guifg=blue guibg=NONE

"true, falseなど
hi Constant ctermfg=magenta ctermbg=NONE guifg=magenta guibg=NONE

"ブール型
hi Boolean ctermfg=magenta ctermbg=NONE guifg=magenta guibg=NONE

"テキスト以外
"eol, extends, precedes を含む
hi NonText ctermfg=cyan ctermbg=NONE guifg=cyan guibg=NONE

"スペシャルキー
"nbsp, tab, trail を含む
hi SpecialKey ctermfg=darkblue ctermbg=NONE guifg=blue guibg=NONE

"補完時のメニュー
hi Pmenu ctermbg=darkblue ctermfg=white
hi PmenuSel ctermbg=darkred ctermfg=white


