return {
  "sindrets/diffview.nvim",
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>b", ":Git blame<CR>", { silent = true })
    end,
  },
}
