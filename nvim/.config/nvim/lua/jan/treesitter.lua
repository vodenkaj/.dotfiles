local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.http = {
    install_info = {
        url = "https://github.com/NTBBloodbath/tree-sitter-http",
        files = {"src/parser.c"},
        branch = "main"
    }
}

require "nvim-treesitter.configs".setup {
    ensure_installed = {"typescript", "tsx", "javascript", "http", "cpp", "c_sharp", "prisma", "lua"},
    indent = {enable = true},
    incremental_selection = {enable = true},
    textobjects = {enable = true},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    }
}
