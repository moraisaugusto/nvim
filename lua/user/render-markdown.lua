local status_ok, render_markdown = pcall(require, "render-markdown")
if not status_ok then
  vim.notify("render-markdown.nvim not loaded")
  return
end

render_markdown.setup({
  file_types = { "markdown", "codecompanion" },

  heading = {
    enabled = true,
    sign = true,
    icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    width = "full",
    left_pad = 1,
  },

  code = {
    enabled = true,
    sign = true,
    width = "full",
    disable_background = { "tab" }
  },

  bullet = {
    enabled = true,
    icons = { "●", "○", "◆", "◇" },
    right_pad = 0,
  },

  checkbox = {
    enabled = true,
  },

  quote = {
    enabled = true,
    icon = "▎",
  },

  link = {
    enabled = true,
  },

  sign = {
    enabled = true,
  },
})

-- Conceal CodeCompanion context tags like <buf>, </buf>, <file>, etc.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "codecompanion",
  callback = function()
    -- Use match with conceal to hide the tags
    vim.fn.matchadd("Conceal", [[</\=\%(buf\|file\|clipboard\|messages\|diagnostics\|diff\)>]], 10, -1, { conceal = "" })
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nvic"
  end,
})
