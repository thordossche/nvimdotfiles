vim.cmd('source $HOME/.config/nvim/lua/configs/plugins.vim')
vim.cmd('source $HOME/.config/nvim/lua/configs/settings.vim')
vim.cmd('source $HOME/.config/nvim/lua/configs/scripts.vim')

require('configs.colorscheme')
require('configs.otherplugins')
require('configs.treesitter')
require('configs.nvimtree')
require('configs.telescope')
require('configs.toggleterm')
require('configs.autopairs')
require('configs.bufferline')
require('configs.lsp.lspinit')
require('configs.lsp.cmp')
require('configs.lsp.luasnip')
