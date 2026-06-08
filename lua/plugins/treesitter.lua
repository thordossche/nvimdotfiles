return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup()

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'elixir', 'eelixir', 'heex', 'python' },
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
