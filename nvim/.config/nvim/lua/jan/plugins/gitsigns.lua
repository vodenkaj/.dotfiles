return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
      on_attach = function()
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<leader>ghn", gs.next_hunk)
        vim.keymap.set("n", "<leader>ghp", gs.prev_hunk)
      end
    })
  end
}
