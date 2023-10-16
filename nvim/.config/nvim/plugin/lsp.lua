local lsp = require('lsp-zero');

lsp.preset("recommended")
lsp.ensure_installed({
    'tsserver',
})
lsp.configure('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })

local cmp = require "cmp"
local lspkind = require "lspkind"
local cmp_mappings = {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = lsp.cmp_action().luasnip_supertab(),
    ["<S-Tab>"] = lsp.cmp_action().luasnip_shift_supertab(),
}

local lspconfig = require('lspconfig');

lspconfig.tsserver.setup {
    root_dir = lspconfig.util.root_pattern(".git"),
    init_options = {
        maxTsServerMemory = "8096",
        update_insert_text = false,
        disableAutomaticTypingAcquisition = true
    }
}

lspconfig.eslint.setup {
    root_dir = lspconfig.util.root_pattern(".git"),
}

lsp.setup_nvim_cmp({
    sources = {
        { name = 'nvim_lsp'},
        { name = 'codeium' },
        { name = 'buffer' }
    },
    mapping = cmp_mappings,
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,     -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(_, vim_item) return vim_item end,
            symbol_map = {
                Codeium = ""
            }
        })
    }
})

vim.diagnostic.config({ virtual_text = true, underline = true, signs = true })

local signs = { Error = "", Warn = "󰀨", Hint = "", Info = " " }
lsp.set_sign_icons({
    error = signs.Error,
    warn = signs.Warn,
    hint = signs.Hint,
    info = signs.Info
})

function Format()
    if string.find(vim.bo.filetype, 'typescript') then
        vim.cmd("EslintFixAll")
    else
        vim.cmd("LspZeroFormat")
    end
end

-- Maps
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>f", Format)

lsp.setup()
