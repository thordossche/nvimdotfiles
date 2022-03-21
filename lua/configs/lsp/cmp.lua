-- COMPLETION
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
lspkind.init()

local cmp = require "cmp"

cmp.setup {
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<tab>"] = cmp.config.disable,
  },

  -- the order of your sources matter (by default). That gives them priority
  -- you can configure:
  --     keyword_length
  --     priority
  --     max_item_count
  sources = {

    { name = "nvim_lsp", max_item_count=12 },
    { name = "null_ls" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
    { name = "nvim_lua" },
    -- { name = "luasnip" },
  },

  -- snippet = {
  --   expand = function(args)
  --     require("luasnip").lsp_expand(args.body)
  --   end,
  -- },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        null_ls = "[linter]",
        -- luasnip = "[snip]",
        -- gh_issues = "[issues]",
        -- tn = "[TabNine]",
      },
    },
  },

  experimental = {
    ghost_text = true,
  },
}

 -- `/` cmdline setup.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Nice symboles in autocomplete
require('lspkind').init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
