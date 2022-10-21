vim.api.nvim_set_keymap('n', 'H', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', ':write | Bdelete<CR>', { noremap = true, silent = true })

require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "write | Bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "write | Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    buffer_close_icon= "",
    offsets = {
      {
        filetype = "NvimTree" ,
      }
    },
    show_buffer_icons = true,
    show_tab_indicators = true,
  },
  highlights = {
    indicator_selected = {
        guifg = "NONE",
        guibg = "NONE",
    },
  }
}

