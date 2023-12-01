vim.g.mapleader = " "
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/home/janv/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.hlsearch = false
vim.opt.wrap = false

vim.opt.cmdheight = 2
vim.opt.updatetime = 50
vim.opt.cursorline = true

-- for parcel hot load to work
vim.opt.backupcopy = "yes"

vim.opt.synmaxcol = 128

vim.api.nvim_create_autocmd({"BufWritePre"},
                            {pattern = "*", command = "%s/\\s\\+$//e"})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"},
                            {pattern = "*.wgsl", command = "set filetype=wgsl"})

vim.opt.autochdir = true
vim.api.nvim_create_user_command("Tq", 'tabclose', {});
