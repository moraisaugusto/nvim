local status_ok, _ = pcall(require, "vim.lsp.config")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
