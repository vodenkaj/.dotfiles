local lspconfig = require "lspconfig"
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp
                                                                      .protocol
                                                                      .make_client_capabilities())

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 {virtual_text = true, underline = true, signs = true})

-- Maps
vim.keymap.set("n", "<leader>vd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>vi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>vh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>vp", vim.diagnostic.goto_prev)

-- Signs symbols
local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

-- Servers
lspconfig.tsserver.setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern(".git"),
    init_options = {
        maxTsServerMemory = "4096",
        update_insert_text = false,
        disableAutomaticTypingAcquisition = true
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

lspconfig.lua_ls.setup {
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
            telemetry = {enable = false}
        }
    }
}

lspconfig.prismals.setup {capablities = capabilities}

lspconfig.sqls.setup {capablities = capabilities}

lspconfig.rust_analyzer.setup {capablities = capabilities}
