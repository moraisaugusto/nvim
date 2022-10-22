local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Install plugins here
return require('packer').startup(function(use)
  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use "neovim/nvim-lspconfig"

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Colorschemes
  use "lunarvim/onedarker.nvim"
  use "sainnhe/gruvbox-material"

  -- Marks
  use "christianchiarulli/harpoon"

  -- Lua development
  use "nvim-lua/plenary.nvim" -- necessary for telescope

  -- Fuzzy searcher
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Key bindings
  use "folke/which-key.nvim"

  -- Telescope - livegrep
  use "BurntSushi/ripgrep"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end) 
