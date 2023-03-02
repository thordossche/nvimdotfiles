require("mason-nvim-dap").setup()

require("dap").adapters.python = {
  type = 'executable';
  command = 'python3';
  args = { '-m', 'debugpy.adapter' };
}

require("dap").adapters.saithon = {
  type = 'executable';
  -- command = os.getenv('HOME') .. '/.envs/accurat/bin/python';
  command = 'python';
  args = { '-m', 'debugpy.adapter' };
  options = {
    envs = {
      ENV_AUTH = os.getenv('HOME') .. '/work/accurat/master_config.json';
      PYTHONPATH = os.getenv('HOME') .. '/work/accurat/saimon/';
    };
  };
}

require("dap").configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "python";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python3'
    end;
  },
  {
    type = 'saithon';
    request = 'launch';
    name = "saithon";
    program = "${file}";
    pythonPath = function()
      return os.getenv('HOME') .. '/.envs/accurat/bin/python';
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


