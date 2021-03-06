
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

cmd 'packadd paq-nvim'         -- Load package

local paq = require'paq-nvim'.paq  -- Import module and bind `paq` function
paq{'savq/paq-nvim', opt=true}     -- Let Paq manage itself

paq {'dracula/vim',  as ='dracula'} --dracula theme
paq 'ryanoasis/vim-devicons'
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
wk.setup {
  plugins = {
    marks = false, -- shOws a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
},
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
}

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
        a = {"<Plug>(coc-codeaction)", "Codeaction"},
        q = {"<Plug>(coc-fix-current)", "Quick fix"},
        r = {"<Plug>(coc-rename)", "Raname"},
        -- f = {"<Plug>coc-format-selected", "Format"},
        f = {"<Plug>(coc-format-selected)", "Format", mode = "v"},
        d = {"<cmd>CocList diagnostics<CR>", "CoC diagnostics"},
        o = {"<cmd>CocList outline<CR>", "CoC outline"},
        s = {"<cmd>CocList -I symbols<CR>", "CoC symbols"}
        -- TODO more coment stuff
    }
}, {prefix = "<leader>"})

wk.register(
    {
        d = {"<Plug>(coc-definition)", "Goto definition"},
        y = {"<Plug>(coc-type-definition)", "Goto type definition"},
        i = {"<Plug>(coc-implementation)", "Goto implementation"},
        r = {"<Plug>(coc-refernces)", "Goto refernces"},
    },
    {prefix = "g"}
)

wk.register(
    {
        ["<M-CR>"] = {"<Plug>(coc-codeaction)", "Codeaction"},
        ["<C-h>"] = {"<C-w>h", "Window left"},
        ["<C-j>"] = {"<C-w>j", "Window down"},
        ["<C-k>"] = {"<C-w>k", "Window up"},
        ["<C-l>"] = {"<C-w>l", "Window right"},
        ["<C-_>"] = {"<Plug>kommentary_line_default", "Comment out"}

    }
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


