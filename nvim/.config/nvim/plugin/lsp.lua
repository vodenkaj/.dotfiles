local lsp = require('lsp-zero');

lsp.preset("recommended")

lsp.ensure_installed({ 'tsserver', 'rust_analyzer' })

local cmp = require "cmp"
local lspkind = require "lspkind"
local cmp_mappings = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

}

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            with_text = false,     -- do not show text alongside icons
            maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item) return vim_item end
        })
    }
})

lsp.configure('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
lsp.configure('jdtls', {
    settings = {
        java = {
            format = {
                settings = {
                    profile = "GoogleStyle",
                    url = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git' }, { upward = true })[1]) ..
                        "/java-code-style.xml"
                }
            }
        }
    }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
        { virtual_text = true, underline = true, signs = true })

-- Signs symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Maps
vim.keymap.set("n", "<leader>vd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>vi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>vh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>vp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

lsp.setup();
