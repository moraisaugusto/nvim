local status_ok, lint = pcall(require, "lint")
if not status_ok then
  vim.notify("nvim-lint not loaded")
  return
end

-- Configure mypy arguments
lint.linters.mypy.args = {
  "--show-column-numbers",
  "--show-error-end",
  "--no-pretty",
  "--no-error-summary",
  "--ignore-missing-imports",
}

-- Enable mypy for python files
lint.linters_by_ft = {
  python = { "mypy" },
}

-- Run mypy on buffer events
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function()
    lint.try_lint("mypy")
  end,
})
