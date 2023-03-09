require("catppuccin").setup {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    term_colors = true,
    transparent_background = false,
    no_italic = false,
    no_bold = false,
    styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {}
    },
    highlight_overrides = {
        mocha = function(C)
            return {
                TabLineSel = {bg = C.pink},
                CmpBorder = {fg = C.surface2},
                Pmenu = {bg = C.none},
                TelescopeBorder = {link = "FloatBorder"}
            }
        end
    }
}
