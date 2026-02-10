return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    local ensure_installed = { 'cmake', 'typescript', 'tsx', 'http', 'lua', 'cpp', 'javascript' }

    local already_installed = ts.get_installed()

    local to_install = vim
        .iter(ensure_installed)
        :filter(function(parser) return not vim.tbl_contains(already_installed, parser) end)
        :totable()

    if #to_install > 0 then ts.install(to_install) end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
      desc = "Try to enable tree-sitter syntax highlighting",
      pattern = "*", -- run on *all* filetypes
      callback = function()
        pcall(function() vim.treesitter.start() end)
      end,
    })
  end
}
