local status_ok, markview = pcall(require, "markview")
if not status_ok then
  vim.notify("Markview not loaded")
  return
end


local opts = {
  preview = {
    filetypes = { "markdown", "codecompanion" },
    ignore_buftypes = {},
  },
}

markview.setup(opts)
