
lua require('init')

autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif "open help in left
color dracula


let g:conjure#client#racket#stdio#command = "racket -i -l xrepl -I sicp"
