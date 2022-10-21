call plug#begin('~/.config/nvim/autoload/plugged')
	" basics
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'

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
	Plug 'ggandor/lightspeed.nvim'

	" telescope
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'AckslD/nvim-neoclip.lua'

	" lsp, highlighting & completion
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'nvim-treesitter/playground'
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'onsails/lspkind-nvim'
	Plug 'hrsh7th/cmp-nvim-lua'
	Plug 'windwp/nvim-autopairs'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
  
  " other
	Plug 'metakirby5/codi.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'akinsho/toggleterm.nvim'
	Plug 'lewis6991/gitsigns.nvim'

call plug#end()
