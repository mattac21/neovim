return {
  'nvim-neotest/neotest',
  requires = {
    -- Test adapter for running go tests
    'nvim-neotest/neotest-go',
  },
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-go',
  },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace 'neotest'
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
          return message
        end,
      },
    }, neotest_ns)
    require('neotest').setup {
      adapters = {
        require 'neotest-go',
      },
    }

    -- Run the nearest test
    vim.keymap.set('n', '<leader>tn', require('neotest').run.run, { desc = '[T]est [N]earest' })

    -- Stop the nearest test
    vim.keymap.set('n', '<leader>tns', require('neotest').run.stop, { desc = '[T]est [N]earest [S]top' })

    -- Run the nearest test in the debugger
    vim.keymap.set('n', '<leader>tdn', function()
      require('neotest').run.run { strategy = 'dap' }
    end, { desc = '[T]est [D]ebug [N]earest' })

    -- Run all the tests in the current file
    vim.keymap.set('n', '<leader>tf', function()
      require('neotest').run.run(vim.fn.expand '%')
    end, { desc = '[T]est [F]ile' })

    -- Run the last test
    vim.keymap.set('n', '<leader>tl', require('neotest').run.run_last, { desc = '[T]est [L]ast' })

    -- Toggle the test output panel
    vim.keymap.set('n', '<leader>tot', require('neotest').output_panel.toggle, { desc = '[T]est [O]uput [T]oggle' })

    -- Show individual test output
    vim.keymap.set('n', '<leader>tos', require('neotest').output.open, { desc = '[T]est [O]uput [S]how' })

    -- Clear the test output panel
    vim.keymap.set('n', '<leader>toc', require('neotest').output_panel.clear, { desc = '[T]est [O]uput [C]lear' })

    -- Toggle the test summary panel (lets you run tests and view output etc...)
    vim.keymap.set('n', '<leader>tst', require('neotest').summary.toggle, { desc = '[T]est [S]ummary [T]oggle' })

    -- Clear the test summary panel
    vim.keymap.set('n', '<leader>tsc', require('neotest').summary.toggle, { desc = '[T]est [S]ummary [C]lear' })
  end,
}
