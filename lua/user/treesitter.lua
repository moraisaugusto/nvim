local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("Treesitter not loaded")
  return
end

treesitter.setup({
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {
    "bicep",
    "hoon" -- https://github.com/urbit-pilled/tree-sitter-hoon/issues/5
  }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "bicep" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
})
