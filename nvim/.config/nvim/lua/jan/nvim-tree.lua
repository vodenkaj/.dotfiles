require "nvim-tree".setup {
    view = {
        mappings = {
            custom_only = false,
            list = {
                {key = "<C-t>", action = ""},
                {key = "s", action = ""}
            }
        }
    }
}
