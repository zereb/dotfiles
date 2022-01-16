local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- system plugins
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    
    -- themes and icons
    use "kyazdani42/nvim-web-devicons";
    use "dracula/vim";
    
    --  completion plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    
    use "junegunn/fzf.vim";
    use "airblade/vim-rooter";
    use "mhinz/vim-signify"; --git gutter
    use "glepnir/galaxyline.nvim";
    use "romgrk/barbar.nvim"; --tabs
    use "kovetskiy/sxhkd-vim";
    use "nvim-treesitter/nvim-treesitter";
    use "folke/which-key.nvim";
    use "akinsho/nvim-toggleterm.lua"; --terminal
    use "norcalli/nvim-colorizer.lua"; --show color in #RGB
    use "b3nj5m1n/kommentary"; --coment line like in idea Ctrl + /
    use "kyazdani42/nvim-tree.lua";
    
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
end)
