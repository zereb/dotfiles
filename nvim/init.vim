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
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'artur-shaik/vim-javacomplete2'
    Plug 'elzr/vim-json'
    Plug 'potatoesmaster/i3-vim-syntax'
    Plug 'vim-airline/vim-airline'
    Plug 'dbeniamine/cheat.sh-vim'
    Plug 'matt-deacalion/vim-systemd-syntax'
    Plug 'udalov/kotlin-vim'
call plug#end()


