local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
  vim.notify("Code Companion not loaded")
  return
end

local setup = ({
  display = {
    diff = {
      enabled = true,
      close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
      layout = "vertical", -- vertical|horizontal split for default provider
      opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
      provider = "default", -- default|mini_diff
    },
  },
  adapters = {
    deepseek = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "deepseek-coder-v2", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "deepseek-coder-v2",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "deepseek",

      keymaps = {
        send = {
          models = { n = "<C-s>", i = "<C-s>" },
        },
        close = {
          models = { n = "<C-c>", i = "<C-c>" },
        },
      },
    },
    inline = {
      adapter = "deepseek",
      keymaps = {
        accept_change = {
          models = { n = "<leader>ca" },
          description = "Accept the suggested change",
        },
        reject_change = {
          models = { n = "<leader>cr" },
          description = "Reject the suggested change",
        },
      },
    },
    cmd = {
      adapter = "deepseek",
    }
  },
  prompt_library = {
    ["Generate Docstring"] = {
      strategy = "chat",
      description = "Create useful docstring",
      opts = {
        index = 11,
        is_slash_cmd = false,
        auto_submit = true,
        short_name = "docs",
      },
      prompts = {
        {
          role = "system",
          content = "You are an experienced Python developer and you have to create docstrings. Just prints the code with the docstring, nothing else.",
        },
        {
          role = "user",
          content = "Create a docstring for this ..."
        }
      },
    }
  }
})

codecompanion.setup(setup)
