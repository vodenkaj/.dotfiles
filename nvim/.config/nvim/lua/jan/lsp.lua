require "lsp_signature".setup(
    {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
            border = "rounded"
        }
    }
)

local lspconfig = require "lspconfig"
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = false,
        underline = true,
        signs = true
    }
)

lspconfig.tsserver.setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("package.json", "yarn.lock", "lerna.json", ".git"),
    init_options = {
        maxTsServerMemory = "4096"
    }
}

lspconfig.eslint.setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git")
}

lspconfig.html.setup {
    capabilities = capabilities,
    cmd = {"vscode-html-language-server", "--stdio"}
}

lspconfig.cssls.setup {
    capabilities = capabilities,
    cmd = {"vscode-css-language-server", "--stdio"}
}

lspconfig.clangd.setup {
    cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--completion-style=bundled",
        "--header-insertion=iwyu",
        "--enable-config"
    },
    capablities = capabilities,
    init_options = {
        completeUnimported = true,
        semanticHighlighting = true
    },
    root_dir = function()
        return vim.loop.cwd()
    end
}

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT"
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
}

lspconfig.prismals.setup {
    capablities = capabilities
}

lspconfig.sqls.setup {
    capablities = capabilities
}

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
