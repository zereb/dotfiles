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

""highlits
    Plug 'kovetskiy/sxhkd-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'sheerun/vim-polyglot'
call plug#end()

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
