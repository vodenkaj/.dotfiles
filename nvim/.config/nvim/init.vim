call plug#begin('~/.vim/plugged')

Plug 'ajh17/Spacegray.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'ray-x/cmp-treesitter'

" Treesitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

"Plug 'mattn/efm-langserver'

" Bracket lines
Plug 'Yggdroot/indentLine'

" LSPSaga code action fix
Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

Plug 'windwp/nvim-autopairs'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-surround'

" Harpoon
Plug 'ThePrimeagen/harpoon'

"Galaxy Line
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'

" Nerd Tree
Plug 'preservim/nerdtree'

Plug 'mhinz/vim-startify'

Plug 'lewis6991/gitsigns.nvim'

call plug#end()

colorscheme spacegray
highlight normal guibg=none
hi clear LineNr
hi clear SignColumn
let g:spacegray_low_contrast = 1

lua require("jan")
lua require'nvim-treesitter.configs'.setup { ensure_installed = {"javascript"}, indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}

nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg "+yG

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

augroup onBuf
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    au BufNewFile,BufRead *.ejs set filetype=html
augroup END
