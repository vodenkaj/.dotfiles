vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")
vim.keymap.set("v", "<C-j>", "<C-w>j")
vim.keymap.set("v", "<C-l>", "<C-w>l")
vim.keymap.set("v", "<C-h>", "<C-w>h")
vim.keymap.set("v", "<C-k>", "<C-w>k")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-d>", "<C-d>zz");
vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("n", "n", "nzz");
vim.keymap.set("n", "N", "Nzz");
