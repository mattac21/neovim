return {
  'shortcuts/no-neck-pain.nvim',
  opts = {
    autocmds = {
      -- When `true`, enables the plugin when you start Neovim.
      -- If the main window is  a side tree (e.g. NvimTree) or a dashboard, the command is delayed until it finds a valid window.
      -- The command is cleaned once it has successfuly ran once.
      --- @type boolean
      enableOnVimEnter = true,
      -- When `rue`, enables the plugin when you enter a new Tab.
      -- note: it does not trigger if you come back to an existing tab, to prevent unwanted interfer with user's decisions.
      --- @type boolean
      enableOnTabEnter = true,
      -- When `true`, reloads the plugin configuration after a colorscheme change.
      --- @type boolean
      reloadOnColorSchemeChange = false,
      -- When `true`, entering one of no-neck-pain side buffer will automatically skip it and go to the next available buffer.
      --- @type boolean
      skipEnteringNoNeckPainBuffer = true,
    },
    width = 150,
  },
  keys = {
    { '<leader>cb', '<CMD>NoNeckPain<CR>', desc = '[C]enter [B]uffer' },
  },
}
