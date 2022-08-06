require("telescope").load_extension("fzy_native")

require("telescope").setup {
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        color_devicons = true,
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
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
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    }
}
