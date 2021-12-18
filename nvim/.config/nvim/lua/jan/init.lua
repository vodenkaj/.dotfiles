require("jan.telescope")
require("jan.lsp")
--require("jan.compe")
require("jan.cmp")
require("jan.evilline")
require('nvim-autopairs').setup{}
--require('jan.treesitter')


P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
