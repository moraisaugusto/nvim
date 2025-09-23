local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
  vim.notify("Code Companion not loaded")
  return
end

local setup = ({
  display = {
    diff = {
      enabled = true,
      close_chat_at = 240,  -- Close an open chat buffer if the total columns of your display are less than...
      layout = "vertical",  -- vertical|horizontal split for default provider
      opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
      provider = "inline", -- inline|mini_diff|split
    },
  },
  adapters = {
    http = {
      deepseek = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "deepseek-coder-v2",
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

      qwen3_coder = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "qwen3",
          opts = {
            vision = true,
            stream = true,
          },
          schema = {
            model = {
              default = "qwen3-coder:30b",
            },
            num_ctx = {
              default = 16384,
            },
            think = {
              default = false,
            },
            keep_alive = {
              default = "5m",
            },
          },
        })
      end,
    },
  },

  strategies = {
    chat = {
      icons = {
        pinned_buffer = " ",
        watched_buffer = "- ",
      },
      adapter = "qwen3_coder",

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
      adapter = "qwen3_coder",
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
      adapter = "qwen3_coder",
    }
  },
  prompt_library = {
    ["Better grammar"] = {
      strategy = "chat",
      description = "Fix grammar phrases",
      opts = {
        index = 11,
        is_slash_cmd = false,
        auto_submit = true,
        short_name = "docs",
      },
      prompts = {
        {
          role = "system",
          content = "You are an english teacher and your main task is to fix grammar mistakes. You will just fix the grammar phrase with no explanation. Just after the correction of grammar phrase, you might add a very short explanation.",
        },
        {
          role = "user",
          content = "Fix the grammar mistake for this..."
        }
      },
    }
  }
})

codecompanion.setup(setup)
