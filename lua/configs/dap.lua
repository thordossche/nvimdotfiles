require("mason-nvim-dap").setup()

require("dap").adapters.python = {
  type = 'executable';
  command = 'python3';
  args = { '-m', 'debugpy.adapter' };
}
require("dap").configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python3'
    end;
  },
}

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})


vim.keymap.set('n', '<leader>Ds', require 'dap'.continue)
vim.keymap.set('n', '<leader>s', require 'dap'.step_over)
vim.keymap.set('n', '<leader>i', require 'dap'.step_into)
vim.keymap.set('n', '<leader>o', require 'dap'.step_out)
vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)


