 local onedarkpro = require("onedarkpro")

 onedarkpro.setup({
   colors = {
     yellow = "#ffaf5f",
     red = "#E06C75",
     gray = "#7D828D",
     },
  hlgroups = {
      CursorLineNr = { fg = "${yellow}", bg = "NONE" },
      TabLineSel = { bg = "NONE", fg = "${yellow}" },

      NvimTreeFolderIcon = { fg = "${yellow}" },
      NvimTreeNormalNC = { bg = "NONE" },
      NvimTreeRootFolder = { fg = "${yellow}" },
  },
  filetype_hlgroups = {
    java = {
      TSVariable = { fg = "NONE" },
      TSField = { fg = "${red}" }
    },
  },
  options = {
      cursorline = true,
      transparency = true,
  },
})
onedarkpro.load()
vim.api.nvim_set_option('cursorlineopt', 'number')
