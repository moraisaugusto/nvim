local status_ok, opencode = pcall(require, "opencode")
if not status_ok then
  vim.notify("Opencode not loaded")
  return
end

_G.Opencode = opencode

vim.o.autoread = true -- Required for `opts.events.reload`

-- Configure snacks.nvim for opencode integration
local snacks_ok, _ = pcall(require, "snacks")
if snacks_ok then
  require("snacks").setup({
    input = {}, -- Enhances `ask()`
    picker = { -- Enhances `select()`
      actions = {
        opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
      },
      win = {
        input = {
          keys = {
            ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
          },
        },
      },
    },
  })
end
