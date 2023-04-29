vim.api.nvim_set_keymap("n", "<leader>D", "[DAP]", {})
vim.keymap.set("n", "[DAP]b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
    {})
vim.keymap.set("n", "[DAP]c", "<cmd>lua require'dap'.continue()<CR>", {})
vim.keymap.set("n", "[DAP]s", "<cmd>lua require'dap'.step_over()<CR>", {})
vim.keymap.set("n", "[DAP]S", "<cmd>lua require'dap'.step_into()<CR>", {})
