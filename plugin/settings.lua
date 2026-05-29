local opt = vim.opt

opt.inccommand = "split"

opt.number = true
opt.relativenumber = true

opt.scrolloff = 10

opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.mouse = 'a'
opt.laststatus = 3

opt.completeopt = { "menu", "menuone", "noselect", "popup" }
opt.shortmess:append("c")


