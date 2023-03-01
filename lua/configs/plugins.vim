call plug#begin('~/.config/nvim/autoload/plugged')
	" basics
	Plug 'kylechui/nvim-surround'
	Plug 'numToStr/Comment.nvim'
	Plug 'windwp/nvim-autopairs'

	" filetree
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'akinsho/bufferline.nvim'
	Plug 'moll/vim-bbye'

	" colorscheme
	Plug 'olimorris/onedarkpro.nvim'

	" styling
	Plug 'ryanoasis/vim-devicons'
	Plug 'ap/vim-css-color'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'nvim-lualine/lualine.nvim'

	" moving
	Plug 'ggandor/leap.nvim'

	" telescope
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'AckslD/nvim-neoclip.lua'

	" LSP
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'onsails/lspkind-nvim'
	Plug 'jay-babu/mason-nvim-dap.nvim'

	" DAP
	Plug 'mfussenegger/nvim-dap'

	" completion
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/cmp-nvim-lua'
	Plug 'hrsh7th/nvim-cmp'

	" snippets
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'

	" treesitter
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-treesitter/playground'
  
  " other
	Plug 'metakirby5/codi.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'akinsho/toggleterm.nvim'
	Plug 'lewis6991/gitsigns.nvim'
	Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
