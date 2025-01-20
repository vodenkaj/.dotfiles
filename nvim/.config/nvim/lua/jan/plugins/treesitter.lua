return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      sync_install = false,
      auto_install = true,
      ensure_installed = {
        "typescript",
        "tsx",
        "javascript",
        "http",
        "prisma",
        "lua",
        "rust",
      },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
    })
  end
}
