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

"~/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/color_powerline.vimを読み取る
let g:Powerline_colorscheme='color_powerline'

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

" 辞書の追加
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'java' : '~/.vim/dict/java.dict'
            \ }


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


