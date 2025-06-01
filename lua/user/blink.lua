local status_ok, blink = pcall(require, "blink.cmp")
if not status_ok then
  vim.notify("Aerial not loaded")
  return
end

local opts = {
  servers = {
    lua_ls = {}
  }
}

--blink.config = 
