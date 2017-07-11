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

