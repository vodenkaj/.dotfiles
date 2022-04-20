set relativenumber
set nu
set nohlsearch
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

set cmdheight=2
set updatetime=50
set cursorline

set path+=**

set wildmode=longest,list,full
set wildmenu

set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set clipboard+=unnamed

set diffopt+=vertical
" for parcel hot load to work
set backupcopy=yes
