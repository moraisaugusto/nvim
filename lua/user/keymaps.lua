-- M = {}
local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", ",", "", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","
keymap("n", "<C-,>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- Buffers
-- Close current
keymap("n", "<c-x>",  ":bd<CR>", opts)
keymap("n", "<leader>b", ":bp<cr>:bd #<cr>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- Change current 
keymap("n", ",.", ":bn<cr>", opts)

-- Fast saving
keymap("n", "<leader>,", ":w<cr>", opts)

-- Insert --
keymap("i", "jk", "<ESC>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Move/Create Windows 
keymap("n", "<C-h>", ":call WinMove('h')<CR>", opts)
keymap("n", "<C-j>", ":call WinMove('j')<CR>", opts)
keymap("n", "<C-k>", ":call WinMove('k')<CR>", opts)
keymap("n", "<C-l>", ":call WinMove('l')<CR>", opts)

-- Tabs --

-- Resize with arrows
keymap("n", "<m-Up>", ":resize -2<CR>", opts)
keymap("n", "<m-Down>", ":resize +2<CR>", opts)
keymap("n", "<m-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<m-Right>", ":vertical resize +2<CR>", opts)

-- NvimTree
keymap("n", "<leader>k", ":NvimTreeToggle<cr>", opts)


-- Telescope / Fuzzy
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>c", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", opts)

-- Move lines
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Helpers

vim.cmd [[
  function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
          wincmd v
      else
          wincmd s
      endif
      exec "wincmd ".a:key
    endif
  endfunction
]]
