local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

return require("lazy").setup({
	spec = {
		{
			import = "jan/plugins",
		},
	},
	defaults = {
		lazy = false,
		version = false,
	},
	--  {
	--    'folke/noice.nvim',
	--    event = "VeryLazy",
	--    dependencies = {
	--      "MunifTanjim/nui.nvim",
	--      {'rcarriga/nvim-notify',
	--        opts = {
	--          timeout = 5000
	--        }
	--      }
	--    },
	--  },
	--  "norcalli/nvim-colorizer.lua",
	--  {
	--    "nvim-telescope/telescope.nvim",
	--    dependencies = { "nvim-lua/plenary.nvim" }
	--  },
	--
	--  "onsails/lspkind-nvim",
	--  "kyazdani42/nvim-web-devicons",
	--
	--  "nvim-treesitter/nvim-treesitter",
	--  { "nvim-treesitter/playground", lazy = true },
	--  "nvim-treesitter/nvim-treesitter-context",
	--
	--  "tpope/vim-surround",
	--  { "NeogitOrg/neogit",           dependencies = { "sindrets/diffview.nvim" } },
	--
	--  "lewis6991/gitsigns.nvim",
	--  "lukas-reineke/indent-blankline.nvim",
	--  { "mfussenegger/nvim-dap", lazy = true },
	--
	--  {
	--    'VonHeikemen/lsp-zero.nvim',
	--    dependencies = {
	--      -- LSP Support
	--      { 'neovim/nvim-lspconfig' },
	--      { 'williamboman/mason.nvim' },
	--      { 'williamboman/mason-lspconfig.nvim', run = ":MasonUpdate" },
	--      { 'elixir-tools/elixir-tools.nvim' },
	--      -- Autocompletion
	--      { 'hrsh7th/nvim-cmp' },
	--      { 'hrsh7th/cmp-buffer' },
	--      { 'hrsh7th/cmp-path' },
	--      { 'saadparwaiz1/cmp_luasnip' },
	--      { 'hrsh7th/cmp-nvim-lsp' },
	--      { 'hrsh7th/cmp-nvim-lua' },
	--      -- Snippets
	--      { 'L3MON4D3/LuaSnip' },
	--      { 'rafamadriz/friendly-snippets' }
	--    }
	--  },
	--
	--  {
	--    'Exafunction/codeium.nvim',
	--    config = function()
	--      require("codeium").setup()
	--    end
	--  },
	--
	--  "jay-babu/mason-nvim-dap.nvim",
	--  {
	--    "iamcco/markdown-preview.nvim",
	--    run = function() vim.fn["mkdp#util#install"]() end,
	--    lazy = true
	--  },
	--
	--  { "chrisbra/csv.vim",      lazy = true },
	--  "nvim-tree/nvim-tree.lua",
	--
	--  {
	--    'j-hui/fidget.nvim',
	--    config = function()
	--      require("fidget").setup {
	--        -- options
	--      }
	--    end,
	--  },
	--  'creativenull/efmls-configs-nvim',
	--  { 'folke/neodev.nvim', lazy = true },
})
