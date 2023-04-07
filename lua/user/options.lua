local options = {
  number = true,
  tabstop = 4,
  expandtab = true,
  cursorline = true,
  relativenumber = true,
  fileencoding = "utf-8",
  clipboard = "unnamedplus",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
