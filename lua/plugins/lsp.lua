return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "lua-language-server" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "j-hui/fidget.nvim" },
    config = function()
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })


      vim.lsp.enable('lua_ls')

      vim.diagnostic.config({ virtual_text = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP keymaps",
        callback = function(args)
          local buf = args.buf
          local map = vim.keymap.set
          map("n", "gd", vim.lsp.buf.definition,    { buffer = buf, desc = "Go to definition" })
          map("n", "gr", vim.lsp.buf.references,    { buffer = buf, desc = "List references" })
          map("n", "gD", vim.lsp.buf.declaration,   { buffer = buf, desc = "Go to declaration" })
          map("n", "gT", vim.lsp.buf.type_definition,{ buffer = buf, desc = "Go to type definition" })
          map("n", "<space>cr", vim.lsp.buf.rename,  { buffer = buf, desc = "Rename symbol" })
          map("n", "<space>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code action" })
        end,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup({
        hint_enable = true,
        hint_prefix = "→ ",
        hint_scheme = "String",
        floating_window = true,
        floating_window_above_cur_line = true,
        extra_trigger_chars = { "(", "," },
        doc_lines = 0,
        max_height = 4,
        max_width = 60,
        wrap = false,
      })
    end,
  },
}
