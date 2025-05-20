return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "mypy",
        "pyright",
        "lua-language-server",
        "bash-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "ruff",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/neodev.nvim", opts = {} },
    },
    lazy = false,
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed    = { "pyright", "ruff" },
        automatic_enable    = false,
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig    = require("lspconfig")

      -- Lua, Elixir, Bash, Java, Docker, etc.
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.elixirls.setup({
        cmd = { "elixir-ls" },
        capabilities = capabilities,
        settings = { elixirLS = { logLevel = "error" } },
      })
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ capabilities = capabilities })
      lspconfig.dockerls.setup({ capabilities = capabilities })
      lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })

      -- Pyright: types & completion
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          pyright = {
            -- let Ruff handle imports
            disableOrganizeImports = true,
          },
        },
      })

      -- Ruff: linting, formatting, import‐sorting via its built-in LSP
      lspconfig.ruff.setup({
        capabilities = capabilities,
        init_options = {
          settings = {
              logLevel = 'debug',
          },
        },
      })

      -- Make sure Ruff doesn't steal hover/signature help
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end
        end,
        desc = "Disable hover from Ruff (use Pyright instead)",
      })

      -- Diagnostics & keymaps
      vim.diagnostic.config({ virtual_text = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
          local buf = args.buf
          local map = vim.keymap.set
          map("n", "gd", vim.lsp.buf.definition,    { buffer = buf })
          map("n", "gr", vim.lsp.buf.references,    { buffer = buf })
          map("n", "gD", vim.lsp.buf.declaration,   { buffer = buf })
          map("n", "gT", vim.lsp.buf.type_definition,{ buffer = buf })
          map("n", "K",  vim.lsp.buf.hover,         { buffer = buf })
          map("n", "<space>cr", vim.lsp.buf.rename,  { buffer = buf })
          map("n", "<space>ca", vim.lsp.buf.code_action, { buffer = buf })
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      -- you can keep mypy or switch to ruff here too:
      lint.linters_by_ft = {
        python = { "mypy" }
      }
      vim.api.nvim_create_autocmd("BufWritePost", {
        callback = function() lint.try_lint() end
      })
    end,
  },
}

