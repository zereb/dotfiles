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
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'itchyny/lightline.vim'  
    Plug 'rbgrouleff/bclose.vim'
    Plug 'francoiscabrol/ranger.vim'

""highlits
    Plug 'potatoesmaster/i3-vim-syntax'
    Plug 'elzr/vim-json'
    Plug 'matt-deacalion/vim-systemd-syntax'
    Plug 'kovetskiy/sxhkd-vim'
call plug#end()

let g:ranger_map_keys = 0 "turn off default reanger.vim

color dracula
noremap <Space> <Nop>
let mapleader = "\<Space>"

map <A-1> :NERDTreeToggle<CR>
map <leader>r :Ranger<CR>
map <leader>pu :PlugInstall<CR>
map <leader>pc :PlugClean<CR>


map <leader>n :bnext<CR>
map <leader>p :bprevious<CR>
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
