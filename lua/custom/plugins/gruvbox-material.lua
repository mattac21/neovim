return {
  'sainnhe/gruvbox-material',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  name = 'gruvbox-material',
  init = function()
    vim.cmd 'set background=dark'
    vim.g.gruvbox_material_background = 'hard'
    -- Chnage the background of Incline
    vim.cmd.colorscheme 'gruvbox-material'
  end,
}
