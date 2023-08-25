require("onedarkpro").setup({
   colors = {
     yellow = "#ffaf5f",
     red = "#E06C75",
     gray = "#7D828D",
   },
  highlights = {
      CursorLineNr = { fg = "${yellow}", bg = "NONE" },
      TabLineSel = { bg = "NONE", fg = "${yellow}" },

      NvimTreeFolderIcon = { fg = "${yellow}" },
      NvimTreeNormalNC = { bg = "NONE" },
      NvimTreeRootFolder = { fg = "${yellow}" },
      ["@variable.python"] = { fg = "NONE" },
      ["@field.python"] = { fg = "${red}" },
  },
  -- ft_highlights = {
  --   java = {
  --     TSVariable = { fg = "NONE" },
  --     TSField = { fg = "${red}" }
  --   },
  --   python = {
  --     TSVariable = { fg = "NONE" },
  --     TSField = { fg = "${red}" }
  --   },
  -- },
  options = {
      cursorline = true,
      transparency = true,
  },
})

vim.cmd("colorscheme onedark")
vim.api.nvim_set_option('cursorlineopt', 'number')
