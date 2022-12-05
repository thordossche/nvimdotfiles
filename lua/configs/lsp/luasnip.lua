local luasnip = require('luasnip')

luasnip.config.set_config({
  history = true,
  updateevents = "TExtChanged,TextChangedI",
  enable_autosnippets = true,
})
luasnip.add_snippets('typescript',
    {
        luasnip.parser.parse_snippet("clog", "console.log($1)")
    }
)
luasnip.add_snippets('cpp',
    {
        luasnip.parser.parse_snippet("cout", "std::cout << $1 << std::endl;")
    }
)
