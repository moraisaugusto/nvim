local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end


local setup = {
    preset = "modern",
}
local mappings = {
      {
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
      },

      -- Aerial
      { "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Aerial", mode = "n" },

      -- FILE
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
      { "<leader>F", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", desc = "Find Text", mode = "n" },

      -- GIT
      { "<leader>g", group = "GIT"},
      { "<leader>gst", "<cmd>Telescope git_status<cr>", desc = "Git status", mode = "n" },
      { "<leader>gB", "<cmd>Gitsigns blame<cr>", desc = "Git blame", mode = "n" },
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Git blame line", mode = "n" },
      { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Git next hunk", mode = "n" },
      { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Git prev hunk", mode = "n" },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Git reset hunk", mode = "n" },
      { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Git reset buffer", mode = "n" },

      -- NvimTree
      { "<leader>k", "<cmd>:NvimTreeToggle<cr>", desc = "Nvim Tree", mode = "n" },

      -- Packer
      { "<leader>p", group = "Packer" },
      { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile"},
      { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install"},
      { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync"},
      { "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status"},
      { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update"},

      -- LSP
      { "<leader>l", group = "LSP" },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action"},
      { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition"},
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format"},

      -- SEARCH
      { "<leader>s", group = "Search" },
      { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches"},
      { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme"},
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help"},
      { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages"},
      { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File"},
      { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers"},
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps"},
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands"},


----[[     a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" }, ]]
----[[     d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" }, ]]
----[[     w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" }, ]]
----[[     f = { "<cmd>lua vim.lsp.buf.format( {async = true} )<cr>", "Format" }, ]]
----[[     i = { "<cmd>LspInfo<cr>", "Info" }, ]]
----[[     I = { "<cmd>LspInstallInfo<cr>", "Installer Info" }, ]]
----[[     j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" }, ]]
----[[     k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" }, ]]
----[[     l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" }, ]]
----[[     q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" }, ]]
----[[     r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" }, ]]
----[[     s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" }, ]]
----[[     S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" }, ]]
----[[   }, ]]
    }
local opts = {}

which_key.add(mappings)



which_key.setup(setup)
--which_key.register(mappings)

--local setup = {
--  plugins = {
--    marks = true,       -- shows a list of your marks on ' and `
--    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--    spelling = {
--      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
--      suggestions = 20, -- how many suggestions should be shown in the list?
--    },
--    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--    -- No actual key bindings are created
--    presets = {
--      operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
--      motions = false,      -- adds help for motions
--      text_objects = false, -- help for text objects triggered after entering an operator
--      windows = true,       -- default bindings on <c-w>
--      nav = true,           -- misc bindings to work with windows
--      z = true,             -- bindings for folds, spelling and others prefixed with z
--      g = true,             -- bindings for prefixed with g
--    },
--  },
--  -- add operators that will trigger motion and text object completion
--  -- to enable all native operators, set the preset / operators plugin above
--  -- operators = { gc = "Comments" },
--  icons = {
--    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--    separator = "➜", -- symbol used between a key and it's label
--    group = "+",      -- symbol prepended to a group
--  },
--  layout = {
--    height = { min = 4, max = 25 },                                             -- min and max height of the columns
--    width = { min = 20, max = 50 },                                             -- min and max width of the columns
--    spacing = 3,                                                                -- spacing between columns
--    align = "left",                                                             -- align columns left, center or right
--  },
--  show_help = true,                                                             -- show help message on the command line when the popup is visible
--}
--
--local opts = {
--  mode = {"n", "v"},     -- NORMAL mode
--  prefix = "<leader>",
--  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
--  silent = true,  -- use `silent` when creating keymaps
--  noremap = true, -- use `noremap` when creating keymaps
--  nowait = true,  -- use `nowait` when creating keymaps
--}
--
--local mappings = {} 
----[[ local mappings = { ]]
----[[   ["a"] = { "<cmd>AerialToggle<cr>", "Aerial" }, ]]
----[[   ["b"] = { ]]
----[[     "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", ]]
----[[     "Buffers", ]]
----[[   }, ]]
----[[   ["k"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" }, ]]
----[[   ["w"] = { "<cmd>w!<CR>", "Save" }, ]]
----[[   ["q"] = { "<cmd>q!<CR>", "Quit" }, ]]
----[[   ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" }, ]]
----[[   ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" }, ]]
----[[   ["f"] = { ]]
----[[     "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", ]]
----[[     "Find files", ]]
----[[   }, ]]
----[[   ["F"] = {"<cmd> lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Find text" }, ]]
----[[   ["P"] = { "<cmd>Telescope projects<cr>", "Projects" }, ]]
----[[   p = { ]]
----[[     name = "Packer", ]]
----[[     c = { "<cmd>PackerCompile<cr>", "Compile" }, ]]
----[[     i = { "<cmd>PackerInstall<cr>", "Install" }, ]]
----[[     s = { "<cmd>PackerSync<cr>", "Sync" }, ]]
----[[     S = { "<cmd>PackerStatus<cr>", "Status" }, ]]
----[[     u = { "<cmd>PackerUpdate<cr>", "Update" }, ]]
----[[   }, ]]
----[[   g = { ]]
----[[     name = "Git", ]]
----[[     g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" }, ]]
----[[     j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" }, ]]
----[[     k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" }, ]]
----[[     l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" }, ]]
----[[     p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" }, ]]
----[[     r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" }, ]]
----[[     R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" }, ]]
----[[     s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" }, ]]
----[[     u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" }, ]]
----[[     o = { "<cmd>Telescope git_status<cr>", "Open changed file" }, ]]
----[[     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" }, ]]
----[[     c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" }, ]]
----[[     d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" }, ]]
----[[   }, ]]
----[[   l = { ]]
----[[     name = "LSP", ]]
----[[     a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" }, ]]
----[[     d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" }, ]]
----[[     w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" }, ]]
----[[     f = { "<cmd>lua vim.lsp.buf.format( {async = true} )<cr>", "Format" }, ]]
----[[     i = { "<cmd>LspInfo<cr>", "Info" }, ]]
----[[     I = { "<cmd>LspInstallInfo<cr>", "Installer Info" }, ]]
----[[     j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" }, ]]
----[[     k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" }, ]]
----[[     l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" }, ]]
----[[     q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" }, ]]
----[[     r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" }, ]]
----[[     s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" }, ]]
----[[     S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" }, ]]
----[[   }, ]]
----[[   s = { ]]
----[[     name = "Search", ]]
----[[     b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" }, ]]
----[[     c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" }, ]]
----[[     h = { "<cmd>Telescope help_tags<cr>", "Find Help" }, ]]
----[[     M = { "<cmd>Telescope man_pages<cr>", "Man Pages" }, ]]
----[[     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, ]]
----[[     R = { "<cmd>Telescope registers<cr>", "Registers" }, ]]
----[[     k = { "<cmd>Telescope keymaps<cr>", "Keymaps" }, ]]
----[[     C = { "<cmd>Telescope commands<cr>", "Commands" }, ]]
----[[   }, ]]
----[[   t = { ]]
----[[     name = "Terminal", ]]
----[[     n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" }, ]]
----[[     u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" }, ]]
----[[     t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" }, ]]
----[[     p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" }, ]]
----[[     f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, ]]
----[[     h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, ]]
----[[     v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" }, ]]
----[[   }, ]]
----[[   p = { ]]
----[[     name = "Gen", ]]
----[[     e = { "<cmd>Gen<cr>", "Gen - LLM" }, ]]
----[[   }, ]]
----[[ } ]]
--
---- Turn off italic separator
--local function set_separator_hl()
--  local hl_cmt = vim.api.nvim_get_hl_by_name("Comment", true)
--  local hl_sep = vim.tbl_extend("force", hl_cmt, { italic = false })
--  return vim.api.nvim_set_hl(0, "WhichKeySeparator", hl_sep)
--end
--
--set_separator_hl()
--
--do
--  local group = vim.api.nvim_create_augroup("whichkey_setting", { clear = true })
--  vim.api.nvim_create_autocmd({ "ColorScheme" }, { pattern = { "*" }, callback = set_separator_hl, group = group })
--end
--
--which_key.setup(setup)
--which_key.register(mappings, opts)
