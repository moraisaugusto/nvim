-- Mypy integration using Neovim's built-in diagnostic system
local M = {}

local function mypy_diagnostics()
  local bufnr = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(bufnr)

  -- Only run for python files
  if vim.bo.filetype ~= "python" then
    return
  end

  -- Run mypy asynchronously
  vim.system({
    "mypy",
    "--show-column-numbers",
    "--no-pretty",
    "--no-error-summary",
    filepath,
  }, { text = true }, function(obj)
    local diagnostics = {}
    if obj.stdout then
      for line in obj.stdout:gmatch("[^\n]+") do
        -- Parse mypy output: filepath:line:col: error: message
        local lnum, col, message = line:match(":(%d+):(%d+):%s*(%a+):%s*(.*)")
        if lnum then
          lnum = tonumber(lnum) - 1
          col = tonumber(col) - 1

          local severity = vim.diagnostic.severity.Error
          if message:match("^warning") then
            severity = vim.diagnostic.severity.Warn
          elseif message:match("^note") then
            severity = vim.diagnostic.severity.Hint
          end

          table.insert(diagnostics, {
            lnum = lnum,
            col = col,
            message = message,
            severity = severity,
            source = "mypy",
          })
        end
      end
    end
    vim.diagnostic.set("mypy", bufnr, diagnostics)
  end)
end

-- Setup autocommands for mypy
function M.setup()
  local group = vim.api.nvim_create_augroup("MypyDiagnostics", { clear = true })

  -- Run mypy on save
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = "*.py",
    callback = mypy_diagnostics,
  })

  -- Run mypy on buffer enter (optional, comment out if unwanted)
  -- vim.api.nvim_create_autocmd("BufEnter", {
  --   group = group,
  --   pattern = "*.py",
  --   callback = mypy_diagnostics,
  -- })
end

return M
