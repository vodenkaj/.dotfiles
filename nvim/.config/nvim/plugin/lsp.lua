local lspconfig = require('lspconfig');

lspconfig.tsserver.setup {
    root_dir = lspconfig.util.root_pattern(".git"),
    init_options = {
        maxTsServerMemory = "8096",
        update_insert_text = false,
        disableAutomaticTypingAcquisition = true,
        preferGoToSourceDefinition = true,
    }
}

lspconfig.prismals.setup {
    root_dir = lspconfig.util.root_pattern(".git"),
}

vim.diagnostic.config({ virtual_text = true, underline = true, signs = true })

function Format()
    vim.lsp.buf.format()
end

-- Maps
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>f", Format)

local eslint = require('efmls-configs.linters.eslint_d')
local prettier = require('efmls-configs.formatters.prettier')
local stylua = require('efmls-configs.formatters.stylua')
local languages = {
  typescript = { eslint, prettier },
  lua = { stylua },
}

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
  -- Pass your custom lsp config below like on_attach and capabilities
  --
  -- on_attach = on_attach,
  -- capabilities = capabilities,
}))
