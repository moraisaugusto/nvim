local status_ok, codecompanion = pcall(require, "codecompanion")
if not status_ok then
  vim.notify("Code Companion not loaded")
  return
end

codecompanion.setup({
  adapters = {
    http = {
      qwen3_moe = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "qwen3-moe",
          schema = {
            model = {
              default = "qwen3-moe-opt:30b",
            },
            num_ctx = {
              default = 16384,
            },
            num_predict = {
              default = -1,
            },
            keep_alive = {
              default = "10m",
            },
          },
        })
      end,
    },
  },
  strategies = {
    chat = {
      adapter = "qwen3_moe",
      tools = {
        read_file = {
          opts = {
            require_approval_before = false,
          },
        },
        grep_search = {
          opts = {
            require_approval_before = false,
          },
        },
      },
      icons = {
        pinned_buffer = " ",
        watched_buffer = "- ",
      },
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
      adapter = "qwen3_moe",
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
    agent = {
      adapter = "qwen3_moe",
      tools = {
        python = {
          callback = "codecompanion.tools.python",
          description = "Execute Python code in a Jupyter notebook environment",
          opts = {
            user_approval = true,
          },
        },
      },
    },
  },
  display = {
    diff = {
      enabled = true,
      close_chat_at = 240,
      layout = "vertical",
      opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
      provider = "inline",
    },
  },
})
