local M = {}

M.icons = {
  diagnostics = {
    Error = " ",
    Warn = "󰀨 ",
    Hint = " ",
    Info = "  ",
  },
  git = {
    added = " ",
    modified = " ",
    removed = " ",
  },
  cmp = {
    Text = "txt",
    Method = "ƒ",
    Function = "ƒ",
    Constructor = "⚒",
    Field = "fld",
    Variable = "var",
    Class = "Cls",
    Interface = "I",
    Module = "M",
    Property = "prop",
    Unit = "U",
    Value = "val",
    Enum = "Enm",
    Keyword = "key",
    Snippet = "Snp",
    Color = "Clr",
    File = "F",
    Reference = "Ref",
    Folder = "Dir",
    EnumMember = "Elt",
    Constant = "Cst",
    Struct = "Str",
    Event = "Evt",
    Operator = "Op",
    TypeParameter = "T",
  }
}

M.init = function()
  require("jan.config.options")
  require("jan.util").lazy_notify()
  require("jan.lazy")
  require("jan.keymaps")
end

return M
