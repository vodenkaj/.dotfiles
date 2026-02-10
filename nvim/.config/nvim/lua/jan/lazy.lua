local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

return require("lazy").setup({
  spec = {
    {
      import = "jan/plugins",
    },
  },
  defaults = {
    lazy = false,
    version = false,
  },

  {
    "tpope/vim-surround"
  },
  {
    "j-hui/fidget.nvim"
  },
  {
    "brenoprata10/nvim-highlight-colors"
  },
})
