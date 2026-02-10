return {
  { "creativenull/efmls-configs-nvim" },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim",  opts = {} },
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
      inlay_hints = {
        enabled = true,
      },
      -- add any global capabilities here
      capabilities = {},
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      require("jan.plugins.lsp.keymaps")

      local eslint = require("efmls-configs.linters.eslint_d")
      local eslint_formatter = require("efmls-configs.formatters.eslint_d")
      local prettier = require("efmls-configs.formatters.prettier")
      local stylua = require("efmls-configs.formatters.stylua")

      local languages = {
        typescript = {
          eslint,
          eslint_formatter,
          prettier,
        },
        typescriptreact = {
          eslint,
          eslint_formatter,
          prettier,
        },
        lua = {
          stylua,
        },
      }

      local efmls_config = {
        cmd = { "efm-langserver" },
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { "eslint.config.js" },
          languages = languages,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }

      vim.lsp.config["efmls"] = efmls_config;
      vim.lsp.config["lua_ls"] = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      };

      vim.lsp.config["tsgo"] = {
        cmd = { "tsgo", "--lsp", "--stdio" },
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        settings = {
          rootMarkers = { ".git/" },
        },
      };


      vim.lsp.enable("efmls");
      vim.lsp.enable("tsgo");
      --vim.lsp.enable("ts_ls");
      vim.lsp.enable("lua_ls");
      vim.lsp.enable("clangd");
    end,
  },
}
