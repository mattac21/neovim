return {
  'rebelot/kanagawa.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  name = 'kanagawa',
  init = function()
    -- Load the colorscheme here.
    vim.cmd.colorscheme 'kanagawa'
  end,
  opts = {
    overrides = function(colors)
      return {
        -- Override the color of IndentLine to be darker
        IblIndent = { fg = colors.theme.ui.bg_p2 },

        -- Override the color of the cursor line to be darker / more transparent
        CursorLine = { bg = colors.theme.ui.bg_p1 },

        -- Chnage the background of Incline
        InclineNormal = { bg = colors.theme.ui.bg_p1 },
      }
    end,
    colors = {
      theme = {
        all = {
          ui = {
            -- Remove the color from the gutter / sign column
            bg_gutter = 'none',
          },
        },
      },
    },
    theme = 'wave',
    background = {
      dark = 'wave',
    },
  },
}
