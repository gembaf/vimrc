"================================================================================
" 最初に実行するやつ
"================================================================================

" 自分のvimrc用のaugroupを作成
" 定義済みのautocmdを削除
augroup MyVimrc
  autocmd!
augroup END

"================================================================================
" 表示
"================================================================================

" 行番号
set number

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
" 移動
"================================================================================

" カーソルが行頭、行末で止まらないように
set whichwrap=b,s,h,l,<,>,[,]

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

" 一行スクロール
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" カーソルキーからABCDが出現する謎現象を解消
inoremap OA <Up>
inoremap OB <Down>
inoremap OC <Right>
inoremap OD <Left>
vnoremap OA <Up>
vnoremap OB <Down>
vnoremap OC <Right>
vnoremap OD <Left>

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

" 表示行単位で移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

