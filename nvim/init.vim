
lua require('init')

autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif "open help in left
color dracula

