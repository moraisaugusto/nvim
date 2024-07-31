--require "nvim-tree".setup {}
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify(nvim_tree, vim.log.levels.ERROR)
  return
end

--local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
--if not config_status_ok then
--  --vim.notify(nvim_tree.config, vim.log.levels.ERROR)
--  return
--end

--local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    --mappings = {
    --  list = {
    --    { key = { "l", "<CR>", "o" }, cb = "edit" },
    --    { key = "h",                  cb = "close_node" },
    --    { key = "v",                  cb = "vsplit" },
    --  },
    --},
  },
}
