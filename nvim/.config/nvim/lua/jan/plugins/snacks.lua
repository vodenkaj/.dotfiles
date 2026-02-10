local util = require("jan.util");

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      win = {
        input = {
          keys = {
            ['<Tab>'] = { 'list_down', mode = { 'n', 'i' } },
            ['<S-Tab>'] = { 'list_up', mode = { 'n', 'i' } },
            ["<c-j>"] = function()
              vim.api.nvim_command(":TmuxNavigateDown");
            end,
            ["<c-k>"] = function()
              vim.api.nvim_command(":TmuxNavigateUp");
            end,
          },
        },
      }
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    git = { enabled = true },
  },
  keys = {
    {
      '<leader>bl',
      function()
        Snacks.git.blame_line()
      end,
      { desc = 'Blame line' },
    },
    {
      '<C-p>',
      function()
        Snacks.picker.smart({ cwd = util.find_root_dir({ ".git" }) })
      end,
      { desc = 'Find files' },
    },
    {
      '<C-g>',
      function()
        Snacks.picker.grep({ cwd = util.find_root_dir({ ".git" }) })
      end,
      { desc = 'Grep files' },
    },
  }
}
