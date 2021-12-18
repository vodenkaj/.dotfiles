set path+=**

set wildmode=longest,list,full
set wildmenu

set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set clipboard+=unnamed

call plug#begin('~/.vim/plugged')

Plug 'ajh17/Spacegray.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'onsails/lspkind-nvim'

" Completion
"Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'ray-x/cmp-treesitter'

" Treesitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'


Plug 'mattn/efm-langserver'

" Bracket lines
Plug 'Yggdroot/indentLine'

" LSPSaga code action fix
" Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim51' }
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

"Plug 'nvim-lua/completion-nvim'

"Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-autopairs'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-surround'

" Harpoon
Plug 'ThePrimeagen/harpoon'

Plug 'ap/vim-css-color'

"Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

"Galaxy Line
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'

" Nerd Tree
Plug 'preservim/nerdtree'

call plug#end()

colorscheme spacegray
highlight normal guibg=none
hi clear LineNr
hi clear SignColumn

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
