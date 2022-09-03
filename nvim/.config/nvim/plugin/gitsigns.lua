require("gitsigns").setup();

vim.keymap.set("n", "<leader>hn", ":Gitsigns next_hunk<CR>", {silent = true})
vim.keymap.set("n", "<leader>hp", ":Gitsigns prev_hunk<CR>", {silent = true})
vim.keymap.set("n", "<leader>bl", ":Gitsigns blame_line<CR>", {silent = true})
