vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.autowrite = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/Users/janvodenka/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.ignorecase = true

vim.opt.updatetime = 50
vim.opt.cursorline = true
vim.opt.autochdir = true

-- for parcel hot load to work
vim.opt.backupcopy = "yes"

vim.opt.synmaxcol = 128

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = "*",
	command = "%s/\\s\\+$//e",
})
