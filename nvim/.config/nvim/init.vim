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
" Plug 'saadparwaiz1/cmp_luasnip'
Plug 'kristijanhusak/vim-dadbod-completion'

" DB
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Treesitter stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Bracket lines
Plug 'lukas-reineke/indent-blankline.nvim'

" LSPSaga code action fix
Plug 'stevearc/dressing.nvim'

Plug 'windwp/nvim-autopairs'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Harpoon
Plug 'ThePrimeagen/harpoon'

Plug 'NTBBloodbath/rest.nvim', {'commit': 'e5f68db73276c4d4d255f75a77bbe6eff7a476ef'}

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
Plug 'chrisbra/csv.vim'

call plug#end()

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

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

command BufOnly silent! execute "%bd|e#|bd#"
