local util = require("jan.util")

return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local api = require("nvim-tree.api")
      vim.keymap.set("n", "<C-t>", api.tree.toggle, { silent = true })
      vim.keymap.set("n", "<C-a>", ":NvimTreeFindFile!<CR>", { silent = true })

      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
          relativenumber = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
        on_attach = function(bufnr)
          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "<C-t>", api.tree.toggle, { silent = true, buffer = bufnr })
        end,
      })
    end,
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    init = function()
      local oil = require("oil")
      oil.setup()
      vim.keymap.set("n", "<C-t>", function()
        oil.open_float()
      end, { silent = true })
    end,
  },

  -- Better notifications
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return 100
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    init = function()
      vim.g.notify_orig = vim.notify
      vim.notify = require("notify")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      _G.telescope_exclusions_enabled = true
      _G.current_folder = false
      _G.prev_telescope = nil
      _G.mode = nil

      local function getParentFolder(opts)
        if opts.current_folder then
          return vim.fn.expand("%:p:h")
        end

        return vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      end

      local function ignorePatters(opts)
        if _G.mode == "GREP" then
          opts.additional_args = function(_)
            return {
              "--glob",
              "!**/test/**",
              "--glob",
              "!**/migrations/**",
            }
          end
        else
          opts.file_ignore_patterns = {
            "test",
            "migrations",
          }
        end

        return opts
      end

      local function TelescopeWithInstance(opts)
        _G.telescope_exclusions_enabled = not _G.telescope_exclusions_enabled
        local params = {
          cwd = getParentFolder(opts),
        }

        if _G.telescope_exclusions_enabled then
          _G.prev_telescope(ignorePatters(params))
        else
          _G.prev_telescope(params)
        end
      end

      require("telescope").setup({
        defaults = {
          file_sorter = require("telescope.sorters").get_fzy_sorter,
          color_devicons = true,

          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

          layout_strategy = "vertical",
          layout_config = {
            horizontal = { mirror = false },
            vertical = { mirror = false },
            prompt_position = "bottom",
          },
          use_less = true,
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          treesitter = true,
          mappings = {
            n = {
              ["<C-s>"] = require("telescope.actions").select_vertical,
              ["<Tab>"] = require("telescope.actions").move_selection_previous,
              ["<S-Tab>"] = require("telescope.actions").move_selection_next,
            },
            i = {
              ["<C-s>"] = require("telescope.actions").select_vertical,
              ["<Tab>"] = require("telescope.actions").move_selection_previous,
              ["<S-Tab>"] = require("telescope.actions").move_selection_next,
              ["<C-e>"] = function()
                vim.api.nvim_buf_delete(0, { force = true }) -- Close the current Telescope buffer
                TelescopeWithInstance({
                  current_folder = _G.current_folder,
                })
               end,
              ["<C-o>"] = function()
                vim.api.nvim_buf_delete(0, { force = true }) -- Close the current Telescope buffer
                _G.current_folder = not _G.current_folder
                TelescopeWithInstance({
                  current_folder = _G.current_folder,
                })
              end,
            },
          },
        },
      })
      -- Maps
      vim.keymap.set("n", "<C-p>", function()
        _G.mode = "FIND"
        _G.prev_telescope = function(opts)
          opts.show_untracked = true
          require("telescope.builtin").git_files(opts)
        end
        require("telescope.builtin").git_files({ show_untracked = true })
      end, { silent = true })

      vim.keymap.set("n", "<C-f>", function()
        _G.mode = "FIND"
        _G.prev_telescope = function(opts)
          require("telescope.builtin").find_files(opts)
        end
        require("telescope.builtin").find_files()
      end, { silent = true })

      vim.keymap.set("n", "<C-b>", function()
        _G.prev_telescope = nil
        require("telescope.builtin").buffers()
      end, { silent = true })

      vim.keymap.set("n", "<leader>vrr", function()
        _G.prev_telescope = nil
        require("telescope.builtin").lsp_references({ path_display = true })
      end, { silent = true })

      vim.keymap.set("n", "<C-g>", function()
        _G.mode = "GREP"
        _G.prev_telescope = function(opts)
          require("telescope.builtin").live_grep(opts)
        end
        require("telescope.builtin").live_grep({
          cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1],
          additional_args = function(opts)
            return {
              "--glob",
              "!**/test/**",
              "--glob",
              "!**/migrations/**",
            }
          end,
        })
      end, { silent = true })
    end,
  },

  -- Telescope file browser
  --{
  --  "nvim-telescope/telescope-file-browser.nvim",
  --  config = function()
  --    vim.g.loaded_netrw = 1
  --    vim.g.loaded_netrwPlugin = 1

  --    local api = require("telescope").extensions.file_browser

  --    vim.keymap.set("n", "<C-t>", api.file_browser, { silent = true })
  --    vim.keymap.set("n", "<C-a>", function()
  --      api.file_browser({
  --        path = "%:p:h",
  --        select_buffer = true,
  --      })
  --    end, { silent = true })
  --  end,
  --  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  --},

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("jan.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            --util.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype",        icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { util.pretty_path() },
          },
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              --color = Util.ui.fg("Statement"),
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
        },
        extensions = { "lazy" },
      }
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "j-hui/fidget.nvim",
    tag = "v1.0.0",
    opts = {
      -- options
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
