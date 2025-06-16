return {
  {
    "bluz71/vim-moonfly-colors",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.opt.syntax = 'enable'
      vim.cmd("colorscheme moonfly")
    end,
  }
}
