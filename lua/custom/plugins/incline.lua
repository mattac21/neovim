return {
  'b0o/incline.nvim',
  config = function()
    local devicons = require 'nvim-web-devicons'

    require('incline').setup {
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            guibg = 'background',
          },
        },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
          filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)

        local function get_git_diff()
          local icons = { removed = '-', changed = '~', added = '+' }
          local signs = vim.b[props.buf].gitsigns_status_dict
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
            end
          end
          if #labels > 0 then
            table.insert(labels, { '┊ ' })
          end
          return labels
        end
        local function get_diagnostic_label()
          local icons = { error = 'E', warn = 'W', info = 'I', hint = 'H' }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { '┊ ' })
          end
          return label
        end

        return {
          { ' ' },
          { get_diagnostic_label() },
          { get_git_diff() },
          { (ft_icon or '') .. ' ', guifg = ft_color },
          { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
          { ' ' },
        }
      end,
    }
  end,
  event = 'VeryLazy',
}
