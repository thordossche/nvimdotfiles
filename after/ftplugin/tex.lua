vim.api.nvim_create_autocmd('BufWritePost', {
    callback = function()
        -- Does not work anymore but is here if needed in the future
        local file = vim.fn.expand('%:p')
        local command = string.format("pdflatex %s >/dev/null 2>&1 && atril %s >/dev/null 2>&1 &", file, file:gsub('%.tex$', '.pdf'))
        vim.fn.system(command)
    end,
})
