-- quickfixlist
vim.api.nvim_set_keymap("n", "<leader>qo", ":copen<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>qc", ":cclose<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>qn", ":cnext<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>qp", ":cprev<cr>", {})

-- source config
vim.api.nvim_set_keymap("n", "<leader>s", ":source ~/.config/nvim/init.lua<cr>", {})

-- comment
require('Comment').setup()

-- surround
require("nvim-surround").setup()

-- leap
require('leap').add_default_mappings()

-- -- lsp_signature
-- require('lsp_signature').setup({
--   floating_window = false,
--   hint_prefix = "> ",
-- })

-- lualine
require('lualine').setup({
  options = {
    component_separators = { left = '', right = ''},
  },
  sections = {
    lualine_c = {'%=', 'filename'},
    lualine_x = {'filetype'},
  },
})

vim.o.cmdheight = 0 
-- Workaround to show macro recording indicator
local cmdheightaugroup = vim.api.nvim_create_augroup('cmdheight', {clear = true})
vim.api.nvim_create_autocmd('RecordingEnter', {
  group = cmdheightaugroup,
  callback = function()
    vim.o.cmdheight = 1
  end
})
vim.api.nvim_create_autocmd('RecordingLeave', {
  group = cmdheightaugroup,
  callback = function()
    vim.o.cmdheight = 0
  end
})

