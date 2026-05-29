return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-y>"] = { "select_and_accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          sql = { "dadbod", "buffer" },
          mysql = { "dadbod", "buffer" },
          plsql = { "dadbod", "buffer" },
        },
        providers = {
          dadbod = { module = "vim_dadbod_completion.blink" },
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        accept = {
          auto_brackets = { enabled = true },
        },
      },
    },
  },
}
