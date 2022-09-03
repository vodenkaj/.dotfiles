vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "~/.vim/undodir"
vim.opt.undofile = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = false

vim.opt.cmdheight = 2
vim.opt.updatetime = 50
vim.opt.cursorline = true

-- for parcel hot load to work
vim.opt.backupcopy = "yes"

vim.opt.synmaxcol = 128

vim.cmd [[ colorscheme nightfox ]]

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*",
    command = "%s/\\s\\+$//e"
})
