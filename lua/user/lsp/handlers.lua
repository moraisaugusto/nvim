local M = {}

-- TODO: backfill this to template
M.setup = function()
  local config = {
    -- disable virtual text
    -- virtual_lines = {
    --   current_line = false
    -- },
    virtual_lines = false,
    virtual_text = false,
    -- show signs using modern 0.10+ API
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN]  = "",
        [vim.diagnostic.severity.INFO]  = "",
        [vim.diagnostic.severity.HINT]  = "",
      },
      priority = 1000,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  -- Configure LSP handlers globally (Neovim 0.10+)
  vim.lsp.config("*", {
    hover = { border = "rounded" },
    signature_help = { border = "rounded" },
  })
end

local function lsp_highlight_document(bufnr)
  local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    buffer = bufnr,
    group = group,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    buffer = bufnr,
    group = group,
    callback = vim.lsp.buf.clear_references,
  })
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  client.server_capabilities.documentFormattingProvider = true
--  lsp_keymaps(bufnr)
  lsp_highlight_document(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

return M
