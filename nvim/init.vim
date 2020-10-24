if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/plugged/')
"    Plug 'preservim/nerdtree'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'mhinz/vim-signify'
    Plug 'liuchengxu/vim-which-key'
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'  
    Plug 'mengelbrecht/lightline-bufferline'

""highlits
    Plug 'kovetskiy/sxhkd-vim' 
    Plug 'jiangmiao/auto-pairs'
    Plug 'sheerun/vim-polyglot'
call plug#end()

autocmd! BufEnter * if &ft ==# 'help' | wincmd L | endif

nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"

"ctrl + u capitalize
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwUi<ESC>
"TAB in general mode will move to text buffer
"nnoremap <TAB> :bnext<CR> 

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <leader>wk <C-w>q
map <leader>wq <C-w>q
map <leader>ww :vsplit<CR>
map <leader>wh :split<CR>


"plug
map <leader>pc :PlugClean<CR>
map <leader>pi :PlugInstall<CR>
map <leader>pu :PlugUpdate<CR>
nnoremap <silent> <space>pe  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>po  :<C-u>CocList commands<cr>

map <leader><leader> :FZF<CR>
map <leader>x :Commands<CR>

"Buffers
map <leader>bb :Buffers<CR>
map <leader>bn :bnext<CR>
map <leader>bp :bprevious<CR>
map <leader>bj :bnext<CR>
map <leader>bk :bprevious<CR>

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
nmap <Leader>b1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>b2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>b3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>b4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>b5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>b6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>b7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>b8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>b9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>b0 <Plug>lightline#bufferline#delete(10)

" Mappings using CoCList:
nnoremap <silent> <space>cd  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>cf  <Plug>(coc-fix-current)
nmap <leader>cn <Plug>(coc-rename)
xmap <leader>cp  <Plug>(coc-format-selected)
nmap <leader>cp  <Plug>(coc-format-selected)


"which key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map =  {}
let g:which_key_map['b'] = { 'name' : '+BUFFERS'}
let g:which_key_map['p'] = { 'name' : '+PLUGGINS'}
let g:which_key_map['c'] = { 'name' : '+CODE'}
let g:which_key_map['w'] = { 'name' : '+WINDOW', 'q' : 'kill window', 'k' : 'kill window'}
let g:which_key_map['<Space>'] = { 'name' : 'FZF'}
let g:which_key_map.1 = 'which_key_ignore'
let g:which_key_map.2 = 'which_key_ignore'
let g:which_key_map.3 = 'which_key_ignore'
let g:which_key_map.4 = 'which_key_ignore'
let g:which_key_map.5 = 'which_key_ignore'
let g:which_key_map.6 = 'which_key_ignore'
let g:which_key_map.7 = 'which_key_ignore'
let g:which_key_map.8 = 'which_key_ignore'
let g:which_key_map.9 = 'which_key_ignore'
let g:which_key_map.0 = 'which_key_ignore'

" Open file explorer
map <A-1> :CocCommand explorer<CR>

""autoclose if eplorer is last buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif 


color dracula

set hidden          ""hz look up how buffers work
set nowrap
set mouse=a         ""mouse enable
set splitbelow      ""splits spawn below
set splitright      ""splits spawn right
set number          ""line numbers
set clipboard=unnamedplus       ""clipboard with evertything
set showtabline=2   ""always show tabline
set showcmd
set cursorline      
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent
set termguicolors
set timeoutlen=500
set noshowmode "remove -- INSERT -- etc.


"plugins


" Lightline

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#clickable = 1

let g:lightline = {'colorscheme': 'wombat'}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}


"" coc

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


autocmd CursorHold * silent call CocActionAsync('highlight') "highlight same words
"CocInstall coc-css coc-eslint coc-highlight coc-html coc-python coc-snippets coc-vetur coc-vimlsp coc-json coc-explorer

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
