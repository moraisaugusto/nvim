local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
-- Experimental features
    _new_sign_calc = true,

    signs = {
        add = { show_count = true },
        change = { show_count = true },
        delete = { show_count = true },
        topdelete = { show_count = true },
        changedelete = { show_count = true },
        untracked = { show_count = false },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    attach_to_untracked = true,
    sign_priority = 6,
    preview_config = {
        -- Options passed to nvim_open_win
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },
    count_chars = {
        [1] = '₁',
        [2] = '₂',
        [3] = '₃',
        [4] = '₄',
        [5] = '₅',
        [6] = '₆',
        [7] = '₇',
        [8] = '₈',
        [9] = '₉',
        ['+'] = '₊',
    },

}
