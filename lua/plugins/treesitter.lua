return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/playground'
    },
    config = function()
        local configs = require'nvim-treesitter.configs'
        configs.setup {
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
                disable = { "python" },
            },
            playground = {
                    enable = true,
            },
            autopairs = {
                enable = true,
            }
        }
    end
}
