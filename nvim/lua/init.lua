
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

vim.cmd 'packadd paq-nvim'         -- Load package

local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

paq {'dracula/vim',  as ='dracula'} --dracula theme
--paq 'ryanoasis/vim-devicons'
paq 'kyazdani42/nvim-web-devicons'
paq {'neoclide/coc.nvim', branch ='release'}
paq 'junegunn/fzf.vim'
paq 'airblade/vim-rooter'
paq 'mhinz/vim-signify' -- git gutter
paq {'glepnir/galaxyline.nvim', branch = 'main'}
paq 'romgrk/barbar.nvim' --tabs
paq 'kovetskiy/sxhkd-vim'
paq {'nvim-treesitter/nvim-treesitter'}
paq 'folke/which-key.nvim' --which key in lua
paq 'akinsho/nvim-toggleterm.lua' --terminal
paq 'norcalli/nvim-colorizer.lua' --show color in #RGB
paq 'b3nj5m1n/kommentary' --coment line like in idea Ctrl + /
-- paq 'kyazdani42/nvim-tree.lua'

require('evilline')

--inspect objects
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end


--keymaps
local wk = require("which-key")
wk.setup {}

wk.register({
    x = {"<cmd>Commands<CR>", "Commands"},
    ["<leader>"] = {"<cmd>FZF<CR>", "FZF"},
    b = {
        name = "BUFFERS",
        b = {"<cmd>Buffers<CR>", "Buffers"},
        n = {"<cmd>BufferNext<CR>", "Next"},
        p = {"<cmd>BufferPrevious<CR>", "Previous"},
        k = {"<cmd>BufferClose<CR>", "Kill current"},
        ["1"] = {"<cmd> BufferGoto 1<CR>", "which_key_ignore"},
        ["2"] = {"<cmd> BufferGoto 2<CR>", "which_key_ignore"},
        ["3"] = {"<cmd> BufferGoto 3<CR>", "which_key_ignore"},
        ["4"] = {"<cmd> BufferGoto 4<CR>", "which_key_ignore"},
        ["5"] = {"<cmd> BufferGoto 5<CR>", "which_key_ignore"},
        ["6"] = {"<cmd> BufferGoto 6<CR>", "which_key_ignore"},
        ["7"] = {"<cmd> BufferGoto 7<CR>", "which_key_ignore"},
        ["8"] = {"<cmd> BufferGoto 8<CR>", "which_key_ignore"},
        ["9"] = {"<cmd> BufferGoto 9<CR>", "which_key_ignore"}
    },
    w = {
        name = "WINDOWS",
        q = {"<cmd>wincmd q<CR>", "Quit"},
        v = {"<cmd>vsplit<CR>", "Vertical split"},
        h = {"<cmd>split<CR>", "Horizontal split"},
        t = {"<cmd>vsplit +terminal<CR>", "terminal split"},
    },
    p = {
        name = "PLUGGINS",
        c = {"<cmd>PaqClean<CR>", "Clean"},
        i = {"<cmd>PaqInstall<CR>", "Install"},
        u = {"<cmd>PaqUpdate<CR>", "Update"},
        l = {"<cmd>PaqList<CR>", "List"},
        o = {"<cmd>PaqLogOpen<CR>", "Open log"},
    },
    t = {
        name = "TERMINAL",
        t = {"<cmd>ToggleTerm<CR>", "Terminal"},
        r = {"<cmd>TermExec cmd=\"ranger\"<CR>", "ranger"}
    },
    l = {
        name = "LSP(CoC) Settings",
        c = {"<cmd>CocList commands<CR>", "CoC Commands"},
        e = {"<cmd>CocList extensions<CR>", "CoC Extentions"},
        d = {"<cmd>CocDisable<CR>", "CoC Disable"},
        t = {"<cmd>CocEnable<CR>", "CoC Enable"},
        m = {"<cmd>CocList marketplace<CR>", "CoC Marketplace"}
    },
    c = {
        name = "CODE",
        x = {"<Plug>kommentary_line_default", "Comment out"},
        c = {"<Plug>kommentary_visual_default", "Comment out", mode = "v"},
        a = {"<Plug>coc-codeaction", "Codeaction"},
        q = {"<Plug>coc-fix-current", "Quick fix"},
        r = {"<Plug>coc-rename", "Raname"},
        f = {"<Plug>coc-format-selected", "Format"},
        f = {"<Plug>coc-format-selected", "Format", mode = "v"},
        d = {"<cmd>CocList diagnostics<CR>", "CoC diagnostics"},
        o = {"<cmd>CocList outline<CR>", "CoC outline"},
        s = {"<cmd>CocList -I symbols<CR>", "CoC symbols"}
        -- TODO more coment stuff
    }
}, {prefix = "<leader>"})

wk.register(
    {
        d = {"<Plug>coc-definition", "Goto definition"},
        y = {"<Plug>coc-type-definition", "Goto type definition"},
        i = {"<Plug>coc-implementation", "Goto implementation"},
        r = {"<Plug>coc-refernces", "Goto refernces"},
    },
    {prefix = "g"}
)

--end keymaps

--TreeSitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"bash", "css", "fish", "html", "java", "javascript", "json", "lua", "typescript", "vue"}, 
  ignore_install = {  }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}
--end TreeSitter
require("toggleterm").setup{}
require'colorizer'.setup()
vim.g.kommentary_create_default_mappings = false


