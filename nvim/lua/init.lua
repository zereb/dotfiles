local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

vim.opt.termguicolors = true
vim.opt.backup = false                  -- dont create backup files
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.conceallevel = 0                -- so that `` is visible in markdown files
vim.opt.mouse = "a"
vim.opt.splitbelow = false
vim.opt.splitright = true               -- force to split on right
vim.opt.number = true                   -- line numbers
vim.opt.clipboard = "unnamedplus"       -- system clipboard
vim.opt.showtabline = 2                 -- always show tabline
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true                -- convert tabs to spaces
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.timeoutlen = 500
vim.opt.showmode = false                -- dont show mode like -- INSERT -- etc.
vim.opt.fileencoding = "utf-8"
vim.opt.ignorecase = true               -- ignore case in search patterns
vim.opt.swapfile = false                -- dont create a swapfile
vim.opt.updatetime = 300                -- completion in milliseconds
vim.opt.signcolumn = "yes"              -- always show the sign column, otherwise it would shift the text each time

require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.lsp.null")
require("user.lualine")
require("user.barbar")
require("user.file-tree")
require("user.trouble")
require("user.signature")

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<a-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)
-- code
--
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
    x = {"<cmd>FzfLua Commands<CR>", "Commands"},
    ["<leader>"] = {"<cmd>FzfLua files<CR>", "FZF"},
    ["1"] = {"<cmd> BufferGoto 1<CR>", "which_key_ignore"},
    ["2"] = {"<cmd> BufferGoto 2<CR>", "which_key_ignore"},
    ["3"] = {"<cmd> BufferGoto 3<CR>", "which_key_ignore"},
    ["4"] = {"<cmd> BufferGoto 4<CR>", "which_key_ignore"},
    ["5"] = {"<cmd> BufferGoto 5<CR>", "which_key_ignore"},
    ["6"] = {"<cmd> BufferGoto 6<CR>", "which_key_ignore"},
    ["7"] = {"<cmd> BufferGoto 7<CR>", "which_key_ignore"},
    ["8"] = {"<cmd> BufferGoto 8<CR>", "which_key_ignore"},
    ["9"] = {"<cmd> BufferGoto 9<CR>", "which_key_ignore"},
    b = {
        name = "BUFFERS",
        b = {"<cmd>FzfLua buffers<CR>", "Buffers"},
        n = {"<cmd>BufferNext<CR>", "Next"},
        p = {"<cmd>BufferPrevious<CR>", "Previous"},
        k = {"<cmd>BufferClose!<CR>", "Kill current"},
   },
    s = {
        name = "SEARCH",
        b = {"<cmd>FzfLua buffers<CR>", "Buffers"},
        f = {"<cmd>FzfLua grep<CR>", "Grep"},
        h = {"<cmd>FzfLua help_tags<CR>", "Help"},
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
        h = {"<cmd>help packer.txt", "Help"},
        l = {"<cmd>PackerSatus<CR>", "List"},
        u = {"<cmd>PackerSync<CR>", "Update, clean and install"},
        c = {"<cmd>PackerClean<CR>", "Clean"},
    },
    t = {
        name = "TERMINAL",
        t = {"<cmd>ToggleTerm<CR>", "Terminal"},
        r = {"<cmd>TermExec cmd=\"ranger\"<CR>", "ranger"}
    },
    l = {
        name = "LSP",
        i = {"<cmd>LspInfo<CR>", "Info"},
        I = {"<cmd>LspInstallInfo<CR>", "Install"},
        t = {"<cmd>TroubleToggle<CR>", "Trouble"}
    },
    g = {
        name = "Git",
        s = {"<cmd>FzfLua git_status<CR>", "Status"},
        c = {"<cmd>FzfLua git_commits<CR>", "Commits"},
        C = {"<cmd>FzfLua git_bcommits<CR>", "Branch Commits"},
        b = {"<cmd>FzfLua git_branches<CR>", "Status"},
        u = {"<cmd>GitBlameOpenCommitURL<CR>", "Open commit URL"},
        t = {"<cmd>GitBlameToggle<CR>", "Toggle blame"},
    },
    e = {
        name = "Eval",
        b = {"<cmd>ConjureEvalBuf<CR>", "Eval buffer"},
        l = {"<cmd>ConjureLogVSplit<CR>", "Log"},
        e = {"<cmd>ConjureEvalCurrentForm<CR>", "Eval current form"},
        r = {"<cmd>ConjureEvalRootForm<CR>", "Eval root"},
        w = {"<cmd>ConjureEvalWord<CR>", "Inspect word"},
        m = {"<cmd>ConjureEvalMarkedForm", "Eval at mark"},
    }
   }, {prefix = "<leader>"})

wk.register(
    {
        D = {"<cmd>FzfLua lsp_declarations)<CR>", "Goto declaration"},
        d = {"<cmd>FzfLua lsp_definitions<CR>", "Goto definition"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation"},
        n = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
        a = {"<cmd>FzfLua lsp_code_actions<CR>", "Actions"},
        r = {"<cmd>FzfLua lsp_references<CR>", "Goto refernces"},
        f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Formatting"},
        l = {"<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Diagnostics"},
    },
    {prefix = "g"}
)

wk.register({
    ["<C-_>"] = {"<Plug>kommentary_line_default<CR>", "Comment out"},
    ["<C-e>"] = {"<cmd>FzfLua buffers<CR>", "Comment out"},
   -- ["<C-_>"] = {"<Plug>kommentary_visual_default<CR>", "Comment out", mode = "v"},
    ["<A-1>"] = {"<cmd>NvimTreeToggle<CR>", ""},
    ["<A-2>"] = {"<cmd>ToggleTerm<CR>", "Terminal"},
    ["<A-CR>"] = {"<cmd>FzfLua lsp_code_actions<CR>", "Terminal"},
    ["<A-f>"] = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Terminal"},
    ["<ESC>"] = {"<cmd>ToggleTerm<CR>", "Terminal", mode = "t"},
})

--end keymaps

--TreeSitter
require("user.treesitter")

require('nvim-ts-autotag').setup()
require("toggleterm").setup{}
require'colorizer'.setup()
require('gitsigns').setup()

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

-- some settings
vim.g.kommentary_create_default_mappings = false
vim.g.gitblame_enabled = 1


require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {
    set_next = "m,",
    next = "mn",
    prev = "mN",
    preview = "m;",
    set_bookmark0 = "m0",
    delete = "md"
  }
}
