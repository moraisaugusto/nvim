-- Mypy integration using Neovim's built-in diagnostic system
local M = {}

-- Create a namespace for mypy diagnostics
local MYPY_NS = vim.api.nvim_create_namespace("mypy")

local function mypy_diagnostics(bufnr)
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  if filepath == "" then return end

  -- Run mypy asynchronously
  vim.system({
    "mypy",
    "--show-column-numbers",
    "--no-pretty",
    "--no-error-summary",
    "--ignore-missing-imports",
    filepath,
  }, { text = true }, function(obj)
    local diagnostics = {}
    if obj.stdout then
      for line in obj.stdout:gmatch("[^\n]+") do
        -- Parse mypy output: filepath:line:col: error: message
        -- mypy output example: /path/to/file.py:10:5: error: Type error message
        local _, _, lnum_str, col_str, severity_str, message = line:find(":(%d+):(%d+):%s*(%a+):%s*(.*)")
        if lnum_str then
          local lnum = tonumber(lnum_str) - 1
          local col = tonumber(col_str) - 1

          local severity = vim.diagnostic.severity.ERROR
          local sev_upper = severity_str:upper()
          if sev_upper == "WARNING" or sev_upper == "WARN" then
            severity = vim.diagnostic.severity.WARN
          elseif sev_upper == "NOTE" then
            severity = vim.diagnostic.severity.HINT
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
    vim.diagnostic.set(MYPY_NS, bufnr, diagnostics)
  end)
end

-- Setup autocommands for mypy
function M.setup()
  local group = vim.api.nvim_create_augroup("MypyDiagnostics", { clear = true })

  -- Run mypy on save
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = "*.py",
    callback = function(args)
      mypy_diagnostics(args.buf)
    end,
  })

  -- Run mypy on buffer enter
  vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    pattern = "*.py",
    callback = function(args)
      mypy_diagnostics(args.buf)
    end,
  })
end

return M
