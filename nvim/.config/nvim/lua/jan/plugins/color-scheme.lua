return {
  "bluz71/vim-moonfly-colors",
  config = function() end,
  opts = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("moonfly")
  end,
}
