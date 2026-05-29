return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter'.setup {
            highlight = { enable = true },
            indent = { enable = true, disable = { "python" } },
        }
    end
}
