if exists('b:did_indent')
  finish
end

inoremap (" ("");<Left><Left><Left>
inoremap (( (<Space><Space>)<Space>{}<Left><Left><Left><Left><Left>

"C言語スタイルのインデント
set cindent

let b:did_indent = 1


