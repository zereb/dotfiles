require('evilline')

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

vim.cmd 'packadd paq-nvim'         -- Load package

local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

paq {'dracula/vim',  as ='dracula'}
paq 'ryanoasis/vim-devicons'
paq 'kyazdani42/nvim-web-devicons'
paq {'neoclide/coc.nvim', branch ='release'}
paq 'junegunn/fzf.vim'
paq 'airblade/vim-rooter'
paq 'mhinz/vim-signify' -- git gutter
paq 'liuchengxu/vim-which-key'
paq {'glepnir/galaxyline.nvim', branch = 'main'}
paq 'romgrk/barbar.nvim'
paq 'kovetskiy/sxhkd-vim'


--inspect objects
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
