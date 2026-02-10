return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  init = function()
    local oil = require("oil")
    oil.setup()
    vim.keymap.set("n", "<C-t>", function()
      oil.open_float()
    end, { silent = true })
  end,
}
