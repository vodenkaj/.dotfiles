require "nvim-tree".setup {
    root_dirs = {".git"},
    prefer_startup_root = true,
    view = {
        mappings = {
            custom_only = false,
            list = {
                {key = "<C-t>", action = ""},
                {key = "s", action = ""}
            }
        },
        adaptive_size = true,
        preserve_window_proportions = true
    },
}

local nvimApi = require("nvim-tree.api")

vim.keymap.set(
    "n",
    "<leader>n",
    function()
        nvimApi.tree.focus()
    end,
    {silent = true}
)

vim.keymap.set(
    "n",
    "<C-n>",
    function()
        nvimApi.tree.open()
    end,
    {silent = true}
)

vim.keymap.set(
    "n",
    "<C-t>",
    function()
        nvimApi.tree.toggle()
    end,
    {silent = true}
)

vim.keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>", {silent = true})
