return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		require('telescope').setup{
			extensions = {
				fzf = {}
			}
		}

		pcall(require('telescope').load_extension('fzf'))

		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>fd', builtin.find_files)
		vim.keymap.set('n', '<leader>fg', builtin.live_grep)
		vim.keymap.set('n', '<leader>fh', builtin.current_buffer_fuzzy_find)

	end
}
