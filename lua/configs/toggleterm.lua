require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
  direction = 'float',
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = 'curved',
    -- width = <value>,
    -- height = <value>,
    -- winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
