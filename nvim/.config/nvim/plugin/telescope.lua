-- Maps
vim.keymap.set("n", "<C-p>", function()
    require('telescope.builtin').git_files({show_untracked = true})
end, {silent = true})

vim.keymap.set("n", "<C-b>",
               function() require('telescope.builtin').buffers() end,
               {silent = true})

vim.keymap.set("n", "<leader>vrr", function()
    require('telescope.builtin').lsp_references {path_display = true}
end, {silent = true})

vim.keymap.set("n", "<C-g>", function()
    require('telescope.builtin').live_grep {
        cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
    }
end, {silent = true})

require("telescope").setup {
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        color_devicons = true,

        file_previewer = require"telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        layout_strategy = "vertical",
        layout_config = {
            horizontal = {mirror = false},
            vertical = {mirror = false},
            prompt_position = "bottom"
        },
        use_less = true,
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        treesitter = true,
        mappings = {
            n = {
                ["<Tab>"] = require("telescope.actions").move_selection_previous,
                ["<S-Tab>"] = require("telescope.actions").move_selection_next
            },
            i = {
                ["<Tab>"] = require("telescope.actions").move_selection_previous,
                ["<S-Tab>"] = require("telescope.actions").move_selection_next
            }
        }
    },
    extensions = {}
}
