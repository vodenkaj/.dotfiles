-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local api = require("nvim-tree.api")
vim.keymap.set('n', '<C-t>', api.tree.toggle, { silent = true })
vim.keymap.set('n', '<C-a>', ":NvimTreeFindFile!<CR>", { silent = true})

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
        relativenumber = true,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    on_attach = function(bufnr)
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '<C-t>', api.tree.toggle, { silent = true, buffer = bufnr })
    end
})
