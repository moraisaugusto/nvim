local status_ok, gitsigns = pcall(require, "chatgpt")
if not status_ok then
  return
end

require("MunifTanjim/nui.nvim").lazy_load()

--[[ use({ ]]
--[[   "jackMort/ChatGPT.nvim", ]]
--[[     config = function() ]]
--[[       require("chatgpt").setup() ]]
--[[     end, ]]
--[[     requires = { ]]
--[[       "MunifTanjim/nui.nvim", ]]
--[[       "nvim-lua/plenary.nvim", ]]
--[[       "nvim-telescope/telescope.nvim" ]]
--[[     } ]]
--[[ }) ]]


--[[ chatgpt.setup { ]]
--[[ } ]]
