-- local fn = vim.fn

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Install plugins here
return require('lazy').setup({
  "nvim-lua/popup.nvim", -- an implementation of the popup api from vim in neovim

  -- cmp plugins
  "hrsh7th/nvim-cmp",         -- code completion
  "hrsh7th/cmp-buffer",       -- buffer completion
  "hrsh7th/cmp-path",         -- path completion
  "hrsh7th/cmp-cmdline",      -- cmdline completion
  "saadparwaiz1/cmp_luasnip", -- snippet completion
  "onsails/lspkind.nvim",     -- lspkind icons

  -- blink
  -- {
  --   "saghen/blink.cmp",
  --   -- optional: provides snippets for the snippet source
  --   dependencies = { "rafamadriz/friendly-snippets" }
  -- },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- see the configuration section for more details
          -- load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    }
  },

  -- snipper engine
  "williamboman/mason.nvim",           -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  "hrsh7th/cmp-nvim-lsp",              -- completion for lsp
  { "l3mon4d3/luasnip", build = "make install_jsregexp" },

  -- snippets
  "rafamadriz/friendly-snippets", -- for multiple languages

  -- file explorer
  "kyazdani42/nvim-tree.lua",

  -- icon
  "kyazdani42/nvim-web-devicons",

  -- colorschemes
  "lunarvim/onedarker.nvim",
  "sainnhe/gruvbox-material",
  "lunarvim/colorschemes",

  -- lua development
  "nvim-lua/plenary.nvim", -- necessary for telescope

  -- fuzzy searcher
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  },
  "nvim-telescope/telescope-media-files.nvim",
  'nvim-telescope/telescope-ui-select.nvim',

  -- grug-far
  'magicduck/grug-far.nvim',

  -- key bindings
  "folke/which-key.nvim",

  -- telescope - livegrep
  "burntsushi/ripgrep",

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "OXY2DEV/markview.nvim" },
    lazy = false,
  },

  -- surround
  "kylechui/nvim-surround",

  -- gitsigns
  "lewis6991/gitsigns.nvim",

  -- bufferline
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",

  -- lualine
  "nvim-lualine/lualine.nvim",

  -- chatgpt
  "jackmort/chatgpt.nvim",

  -- aerial
  "stevearc/aerial.nvim",

  -- coda companion
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  -- mini.icons for which-key
  "echasnovski/mini.icons",

  -- indent blankline
  "lukas-reineke/indent-blankline.nvim",

  -- linting (mypy, etc.)
  "mfussenegger/nvim-lint",

  -- Snacks
  -- {
  --   "folke/snacks.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   ---@type snacks.Config
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --     bigfile = { enabled = true },
  --     dashboard = { enabled = false },
  --     explorer = { enabled = true },
  --     indent = { enabled = true },
  --     input = { enabled = true },
  --     picker = { enabled = true },
  --     notifier = { enabled = true },
  --     quickfile = { enabled = true },
  --     scope = { enabled = true },
  --     scroll = { enabled = true },
  --     statuscolumn = { enabled = true },
  --     words = { enabled = true },
  --   },
  -- },

  -- Opencode
  -- {
  --   "nickjvandyke/opencode.nvim",
  --   version = "*", -- Latest stable release
  --   dependencies = { "folke/snacks.nvim" },
  -- }


})
