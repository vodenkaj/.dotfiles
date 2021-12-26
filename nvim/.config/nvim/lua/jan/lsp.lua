local saga = require 'lspsaga'
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

saga.init_lsp_saga()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = true,
		signs = true,
	}
)

local function on_attach(client)
end

lspconfig.tsserver.setup{
    capabilities = capabilities,

    on_attach = function(client)
        on_attach(client)
        client.resolved_capabilities.document_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- import all
            import_all_timeout = 5000, -- ms
            import_all_priorities = {
                buffers = 4, -- loaded buffer names
                buffer_content = 3, -- loaded buffer content
                local_files = 2, -- git files or files with relative path markers
                same_file = 1, -- add to existing import statement
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,

            -- eslint
            eslint_enable_code_actions = false,
            eslint_enable_disable_comments = true,
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = false,
            eslint_opts = {},

            -- formatting
            enable_formatting = true,
            formatter = "prettier",
            formatter_config_fallback = nil;
            formatter_opts = {},

            -- update imports on file move
            update_imports_on_move = true,
            require_confirmation_on_move = true,
            watch_dir = ".",

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
        }

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)
    end
}
require'lspconfig'.eslint.setup{}

require'lspconfig'.html.setup{
    cmd = {"html-languageserver", "--stdio"}
}

require'lspconfig'.clangd.setup {
    root_dir = function() return vim.loop.cwd() end
}

local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.env.HOME .. '/.vim/plugged/'
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require("luasnip/loaders/from_vscode").lazy_load({
    paths = snippets_paths(),
    include = nil,  -- Load all languages
    exclude = {}
})
