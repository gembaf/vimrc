"================================================================================
" 文字ハイライト
"================================================================================

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

" 全角スペース
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
autocmd BufNewFile,BufRead * match ZenkakuSpace /　/

" ステータスライン
highlight StatusLine ctermfg=black ctermbg=cyan

