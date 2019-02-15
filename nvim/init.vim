set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent
set number
set termguicolors
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged/')
    Plug 'elzr/vim-json'

call plug#end()
