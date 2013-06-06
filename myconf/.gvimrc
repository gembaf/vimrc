"=====================================================================
" gvim用の設定
"=====================================================================
set guifont=Ricty_for_Powerline:h13
colorscheme slate
set guioptions=NULL

"===========================================================
" color
"===========================================================

"vim-hierの設定
execute "highlight ucurl_my gui=undercurl guisp=Red"
let g:hier_highlight_group_qf = "ucurl_my"

source ~/.vim/myconf/color.vim

