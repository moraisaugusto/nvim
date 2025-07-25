local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path }
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

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Install plugins here
return require('packer').startup(function(use)
  -- Plugin Manager
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

  -- cmp plugins
  use "hrsh7th/nvim-cmp"         -- code completion
  use "hrsh7th/cmp-buffer"       -- buffer completion
  use "hrsh7th/cmp-path"         -- path completion
  use "hrsh7th/cmp-cmdline"      -- cmdline completion
  use "saadparwaiz1/cmp_luasnip" -- snippet completion
  use "onsails/lspkind.nvim"     -- lspkind icons

  -- Blink
  -- use {
  --   "saghen/blink.cmp",
  --   -- optional: provides snippets for the snippet source
  --   requires = { "rafamadriz/friendly-snippets" }
  -- }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    }
  }                                       -- snipper engine
  use "williamboman/mason.nvim"           -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "hrsh7th/cmp-nvim-lsp"              -- completion for lsp
  use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }

  -- Snippets
  use "rafamadriz/friendly-snippets" -- for multiple languages

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Colorschemes
  use "lunarvim/onedarker.nvim"
  use "sainnhe/gruvbox-material"
  use "LunarVim/Colorschemes"

  -- Marks
  --use "christianchiarulli/harpoon"

  -- Lua development
  use "nvim-lua/plenary.nvim" -- necessary for telescope

  -- Fuzzy searcher
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  }
  use "nvim-telescope/telescope-media-files.nvim"
  use 'nvim-telescope/telescope-ui-select.nvim'

  -- Grug-far
  use 'MagicDuck/grug-far.nvim'

  -- Key bindings
  use "folke/which-key.nvim"

  -- Telescope - livegrep
  use "BurntSushi/ripgrep"

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Surround
  use "kylechui/nvim-surround"

  -- Gitsigns
  use "lewis6991/gitsigns.nvim"

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Lualine
  use "nvim-lualine/lualine.nvim"

  -- ChatGPT
  use "jackMort/ChatGPT.nvim"

  -- Aerial
  use "stevearc/aerial.nvim"

  -- Gen - Ollama interface
  -- use "David-Kunz/gen.nvim"

  -- Coda companion
  use {
    "olimorris/codecompanion.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }

  -- markdown
  use "OXY2DEV/markview.nvim"

  -- Mini.icons for which-key
  use "echasnovski/mini.icons"


  -- Indent Blankline
  use "lukas-reineke/indent-blankline.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
