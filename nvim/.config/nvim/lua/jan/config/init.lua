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
}

M.init = function()
  require("jan.config.options")
  require("jan.util").lazy_notify()
  require("jan.lazy")
  require("jan.keymaps")
end

return M
