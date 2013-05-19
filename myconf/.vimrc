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

"===========================================================
" NeoBundle
" ----------------------------------------------------------
"  pluginを管理するplugin
"  新しいpluginを入れたい場合は、
"  NeoBundle 'hoge/huga' と書き込み、:NeoBundleInstall
"===========================================================

"最初にいろいろOFF
filetype off
filetype indent plugin off
"
"SSL認証のエラーを無視して回避
"let $GIT_SSL_NO_VERIFY="true"

"NeoBundleを初期化して、NeoBundle自身もNeoBundleで管理
if has('vim_starting')
  if &runtimepath !~ '/neobundle.vim'
    "自身のNeoBundleを置いている場所
    execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
  endif
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'jceb/vim-hier'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'thinca/vim-quickrun.git'
NeoBundle 'thinca/vim-scouter.git'
NeoBundle 'mattn/zencoding-vim.git'
NeoBundle 'vim-jp/vimdoc-ja.git'
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc.git', {
      \ 'build' : {
      \   'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
      \   'cygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \   },
      \ }

"最初にOFFにしたいろいろをON
filetype indent plugin on

"===========================================================
" Vim-powerline
"===========================================================

"fontの指定
set guifont=Ricty_for_Powerline

"256色使えるように
set t_Co=256

"スペシャルシンボル
"let g:Powerline_symbols = 'compatible'
"let g:Powerline_symbols = 'unicode'
let g:Powerline_symbols = 'fancy'

"シンボルを上書きする
let g:Powerline_symbols_override = {
\ 'BRANCH': [0x2213],
\ }

"モード名を上書きする
let g:Powerline_mode_n = 'Normal'
let g:Powerline_mode_i = 'Insert'
let g:Powerline_mode_R = 'Replace'
let g:Powerline_mode_v = 'Visual'
let g:Powerline_mode_V = 'V-Line'
let g:Powerline_mode_cv = 'V-Block'
let g:Powerline_mode_s = 'Select'
let g:Powerline_mode_S = 'S-Line'
let g:Powerline_mode_cs = 'S-Block'

"ファイルへの相対パスを表示する
let g:Powerline_stl_path_style = 'relative'

"ノーマルモード後にすぐ反映されない対策
if has('unix') && !has('gui_running')
  inoremap <silent> <ESC> <ESC>
  vnoremap <silent> <ESC> <ESC>
endif

"~/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/mycolor.vimを読み取る
let g:Powerline_colorscheme='mycolor'

"===========================================================
" Vim-quickrun
"===========================================================

"WatchdogsRun終了時にquickfixウィンドウが閉じる
let g:quickrun_config = {
      \ "watchdogs_checker/_" : {
      \   "hook/close_quickfix/enable_exit" : 1,
      \   "runner/vimproc/updatetime" : 40,
      \   },
      \ }

"===========================================================
" vim-watchdogs
"===========================================================

"g:quickrun_configの設定を渡す
"g:quickrun_configの後に書く
call watchdogs#setup(g:quickrun_config)

"保存したときにシンタックスチェック
let g:watchdogs_check_BufWritePost_enable = 1

"filetypeごとに有効無効を設定
let g:watchdogs_check_BufWritePost_enables = {
      \ "c" : 1
      \ }

"一定時間キー入力がなかったときにシンタックスチェック
let g:watchdogs_check_CursorHold_enable = 1

"===========================================================
" Vim-hier
"===========================================================

"ハイライトの設定
execute "highlight ucurl_my cterm=undercurl ctermfg=Red"
let g:hier_highlight_group_qf = "ucurl_my"

"ハイライト箇所を更新
nnoremap <Space>hiu :HierUpdate<CR>

"ハイライトを削除
nnoremap <Space>hic :HierClear<CR>

"===========================================================
" ZenCoding-vim
"===========================================================

"indentをtabからspaceへ
let g:user_zen_setting = {
      \ 'indentation' : '  '
      \ }


"===========================================================
" Neosnippet
"===========================================================
"=================================================
" 機能のON/OFFや設定
"=================================================

"neocomplcacheを起動時に有効化
let g:neocomplcache_enable_at_startup = 1

"大文字がくるまで大文字小文字を無視
let g:neocomplcache_enable_smart_case = 1

"大文字を区切りとしたワイルドカード
"重くなるので使わない
let g:neocomplcache_enable_camel_case_completion = 0

"underbar区切りの補完
let g:neocomplcache_enable_underbar_completion = 1

"数字を選択するクイックマッチを有効化
let g:neocomplcache_enable_quick_match = 1

"シンタックスをキャッシュするときの最小の長さ
let g:neocomplcache_min_syntax_length = 3

"ポップアップメニューに表示する候補最大数
let g:neocomplcache_max_list = 30

"補完候補とするキーワードの最小の長さ
let g:neocomplcache_min_keyword_length = 3

"ワイルドカード展開をする
let g:neocomplcache_enable_wildcard = 1

"自動補完を開始する長さ
let g:neocomplcache_auto_completion_start_length = 2

"CursorHoldIを使用しない
let g:neocomplcache_enable_cursor_hold_i = 0

"入力してから補完候補を表示するまでの時間(ms)
let g:neocomplcache_cursor_hold_i_time = 500

"手動補完を開始する長さ
let g:neocomplcache_manual_completion_start_length = 0

"自動補完開始時、自動的に候補を選択
let g:neocomplcache_enable_auto_select = 0

"camel case補完(大文字をワイルドカードのように扱う)を無効化
let g:neocomplcache_enable_camel_case_completion = 0

"fuzzy補完を無効化
let g:neocomplcache_enable_fuzzy_completion = 0

"neocomplcacheが使用する一時ファイルのディレクトリ
let g:neocomplcache_temporary_dir = expand('~/.neocom')

"neocomplcacheが使用するsnippetsのディレクトリ
let g:neocomplcache_snippets_dir = expand('~/.vim/snippets')

"オムニ補完をRuby対応にする
let g:neocomplcache_omni_functions = {
      \ 'ruby' : 'rubycomplete#Complete',
      \ }

"キーワード区切りの追加
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns.default = '\h\w*'
let g:neocomplcache_keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"オムニ補完パターンの追加
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.mail = '^\s*\w\+'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'

"=================================================
" keymap
"=================================================

"<Leader>esでスニペットファイルを編集
nnoremap <Space>es :<C-u>NeoComplCacheEditSnippets<CR>

"スニペット補完用マッピング
"imap <C-k> <Plug>(neocomplcache_snippets_expand)
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

"<C-h>や<BS>を押したときにポップアップを削除
"inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"

"ポップアップを閉じる
inoremap <expr><C-t> neocomplcache#cancel_popup()

"選択している候補を確定
"inoremap <expr><C-k> neocomplcache#close_popup()

"前回行われた補完をキャンセル
inoremap <expr><C-g> neocomplcache#undo_completion()

"補完候補の中から共通する部分を補完
inoremap <expr><C-l> neocomplcache#complete_common_string()

"TABで補完候補の選択
"inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"imap <expr><TAB> neosnippet#expandable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: "\<TAB>"

""uniteと連携させる場合
"imap <C-k> <Plug>(neocomplcache_start_unite_complete)
"smap <C-k> <Plug>(neocomplcache_start_unite_complete)

"======================================================================
" 基本的な設定
"======================================================================

"autocmd!をMyAutoCmdに追加
augroup MyAutoCmd
  autocmd!
augroup END

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
set shiftwidth=2
set tabstop=2
set softtabstop=2

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
  NeoComplCacheAutoCompletionLength 2

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
"inoremap {% {%<Space><Space>%}<Left><Left><Left>
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


