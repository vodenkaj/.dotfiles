return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
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
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
      highlight = { enable = true, additional_vim_regex_highlighting = false },
    })
  end
}
