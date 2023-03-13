"================================================================================
" Neosnippet
"================================================================================

" neocomplcacheを起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 大文字がくるまで大文字小文字を無視
let g:neocomplcache_enable_smart_case = 1

" 大文字を区切りとしたワイルドカード
" 重くなるので使わない
let g:neocomplcache_enable_camel_case_completion = 0

" underbar区切りの補完
let g:neocomplcache_enable_underbar_completion = 1

" 数字を選択するクイックマッチを有効化
let g:neocomplcache_enable_quick_match = 1

" シンタックスをキャッシュするときの最小の長さ
let g:neocomplcache_min_syntax_length = 3

" ポップアップメニューに表示する候補最大数
let g:neocomplcache_max_list = 30

" 補完候補とするキーワードの最小の長さ
let g:neocomplcache_min_keyword_length = 3

" ワイルドカード展開をする
let g:neocomplcache_enable_wildcard = 1

" 自動補完を開始する長さ
let g:neocomplcache_auto_completion_start_length = 2

" CursorHoldIを使用しない
let g:neocomplcache_enable_cursor_hold_i = 0

" 入力してから補完候補を表示するまでの時間(ms)
let g:neocomplcache_cursor_hold_i_time = 500

" 手動補完を開始する長さ
let g:neocomplcache_manual_completion_start_length = 0

" 自動補完開始時、自動的に候補を選択
let g:neocomplcache_enable_auto_select = 0

" camel case補完(大文字をワイルドカードのように扱う)を無効化
let g:neocomplcache_enable_camel_case_completion = 0

" fuzzy補完を無効化
let g:neocomplcache_enable_fuzzy_completion = 0

" neocomplcacheが使用する一時ファイルのディレクトリ
let g:neocomplcache_temporary_dir = expand('~/.neocom')

" neocomplcacheが使用するsnippetsのディレクトリ
let g:neosnippet#snippets_directory = expand('~/.vim/snippets')

" スニペットが画面の上でチラチラして邪魔なので一旦無効化
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" オムニ補完をRuby対応にする
let g:neocomplcache_omni_functions = {
      \ 'ruby' : 'rubycomplete#Complete',
      \ }

" キーワード区切りの追加
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns.default = '\h\w*'
let g:neocomplcache_keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" オムニ補完パターンの追加
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.mail = '^\s*\w\+'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'

" スニペット補完用マッピング
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" ポップアップを閉じる
inoremap <expr><C-t> neocomplcache#cancel_popup()

" 前回行われた補完をキャンセル
inoremap <expr><C-g> neocomplcache#undo_completion()

" 補完候補の中から共通する部分を補完
inoremap <expr><C-l> neocomplcache#complete_common_string()

