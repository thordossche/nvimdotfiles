return {
    {
        "selimacerbas/markdown-preview.nvim",
        dependencies = { "selimacerbas/live-server.nvim" },
        ft = { "markdown" },
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreview<CR>", desc = "Markdown Preview" },
            { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", desc = "Markdown Preview Stop" },
            { "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview Toggle" },
        },
    },
}
