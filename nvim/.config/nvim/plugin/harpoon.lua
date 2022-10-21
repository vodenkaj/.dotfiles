require("harpoon").setup()

vim.keymap.set("n", "<leader>a",
               function() require('harpoon.mark').add_file() end,
               {silent = true})

vim.keymap.set("n", "C-e>",
               function() require("harpoon.ui").toggle_quick_menu() end,
               {silent = true})
