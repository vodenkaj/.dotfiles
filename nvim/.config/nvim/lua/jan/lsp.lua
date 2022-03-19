require 'lspsaga'.init_lsp_saga()
require "lsp_signature".setup()

local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = true,
		signs = true,
	}
)

lspconfig.tsserver.setup{
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
}


lspconfig.eslint.setup{
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
}

lspconfig.html.setup{
    capabilities = capabilities,
    cmd = {"vscode-html-language-server", "--stdio"},
}

lspconfig.cssls.setup{
    capabilities = capabilities,
    cmd = {"vscode-css-language-server", "--stdio"},
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
    semanticHighlighting = true,
  },
    root_dir = function() return vim.loop.cwd() end
}
local omnisharp_bin = ""

if package.config:sub(1,1) == '\\' then
    omnisharp_bin = "C:\\Program Files\\Omnisharp\\Omnisharp.exe"
end

local pid = vim.fn.getpid()

lspconfig.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
};
