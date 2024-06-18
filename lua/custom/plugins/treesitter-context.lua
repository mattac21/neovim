return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      multiline_threshold = 1,
      max_lines = 10,
    },
    config = function(_, opts)
      -- Chnage color of context to match cursor line color
      vim.api.nvim_set_hl(0, 'TreesitterContext', { link = 'CursorLine' })

      -- Change line number color in context to match current line number color
      vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { link = 'CursorLineNr' })

      require'treesitter-context'.setup(opts)
    end,
  },
}
