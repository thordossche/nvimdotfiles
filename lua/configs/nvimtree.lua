vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", {})

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))

end

require("nvim-tree").setup({
  on_attach = on_attach,
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
})

-- Open tree when nvim with directory
local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1
  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
