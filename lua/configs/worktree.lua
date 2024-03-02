require('git-worktree').setup({})
require('telescope').load_extension('git_worktree')


vim.api.nvim_set_keymap('n', '<leader>wt', ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>wc', ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", { noremap = true })

