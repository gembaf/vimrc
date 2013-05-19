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

"コメント
hi Comment guifg=darkgreen guibg=NONE

"文字列
hi String guifg=grey guibg=NONE

"数字
hi Number guifg=lightred guibg=NONE

"行番号
hi LineNr guifg=blue guibg=NONE

"true, falseなど
hi Constant guifg=magenta guibg=NONE

"ブール型
hi Boolean guifg=magenta guibg=NONE

"テキスト以外
"eol, extends, precedes を含む
hi NonText guifg=cyan guibg=NONE

"スペシャルキー
"nbsp, tab, trail を含む
hi SpecialKey guifg=blue guibg=NONE

"補完時のメニュー
hi Pmenu guibg=gray guifg=black
hi PmenuSel guibg=darkred guifg=white


