return {
   "darianmorat/gruvdark.nvim",
   lazy = false,
   priority = 1000,
   opts = {},
   init = function()
      vim.cmd.colorscheme 'gruvdark-light'
   end,
}
