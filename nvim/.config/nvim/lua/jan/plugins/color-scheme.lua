return {
  "savq/melange-nvim",
  config = function() end,
  opts = function()
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("melange")
  end,
}
