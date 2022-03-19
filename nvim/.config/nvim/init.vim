call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'ray-x/cmp-treesitter'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Treesitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'ibhagwan/fzf-lua'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'mattn/efm-langserver'

" Bracket lines
Plug 'lukas-reineke/indent-blankline.nvim'

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
Plug 'vodenkaj/galaxyline.nvim' , {'branch': 'main'}

" Nvim Tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'mhinz/vim-startify'

Plug 'lewis6991/gitsigns.nvim'
Plug 'sbdchd/neoformat'
Plug 'lilydjwg/colorizer'
Plug 'RRethy/vim-illuminate'

call plug#end()

colorscheme spacegray

nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg "+yG

lua require("jan")

augroup onBuf
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufNewFile,BufRead *.ejs set filetype=html
augroup END
