local status_ok, mini_icons = pcall(require, "mini.icons")
if not status_ok then
  vim.notify("Mini.icons not loaded")
  return
end

mini_icons.setup()
