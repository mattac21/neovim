return {
  'bluz71/vim-moonfly-colors',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  name = 'moonfly',
  init = function()
    -- Set moonlfy to be transparent
    vim.g.moonflyTransparent = true

    -- Set cursor column and cursor line colors
    local custom_highlight = vim.api.nvim_create_augroup('CustomHighlight', {})
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'moonfly',
      callback = function()
        vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'NONE', fg = '#80a0ff' })
        vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#1c1c1c' })
      end,
      group = custom_highlight,
    })

    -- Load the colorscheme here.
    vim.cmd.colorscheme 'moonfly'
  end,
}
