require("nvim-autopairs").setup {
  check_ts = true,
  disable_filetype = { "TelescopePrompt" },
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
