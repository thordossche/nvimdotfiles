vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", {})

require("nvim-tree").setup({
    filters = {
      dotfiles = true
    },
    view = {
      mappings = {
        list = {
          { key = "s", action = "vsplit" },
          { key = "h", action = "split" },
          { key = "t", action = "tabnew" },
        }
      }
    },
    actions = {
      open_file = {
        quit_on_open = true,
      }
    },
})
