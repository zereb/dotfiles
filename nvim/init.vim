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
    Plug 'preservim/nerdtree'
    Plug 'elzr/vim-json'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'potatoesmaster/i3-vim-syntax'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'matt-deacalion/vim-systemd-syntax'
    Plug 'kovetskiy/sxhkd-vim'
call plug#end()

color dracula
noremap <Space> <Nop>
let mapleader = "\<Space>"

map <A-1> :NERDTreeToggle<CR>

