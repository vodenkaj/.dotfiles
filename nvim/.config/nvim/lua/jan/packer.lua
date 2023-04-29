return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use { "catppuccin/nvim", as = "catppuccin" }
    use("norcalli/nvim-colorizer.lua")

    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use("onsails/lspkind-nvim")
    use("kyazdani42/nvim-web-devicons")

    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")

    use("tpope/vim-surround")
    use("tpope/vim-fugitive")

    use("lewis6991/gitsigns.nvim")
    use("mbbill/undotree")
    use("kyazdani42/nvim-tree.lua")
    use { "vodenkaj/rest.nvim", branch = "allow-body-only-in-supported-methods" }
    use { "lukas-reineke/indent-blankline.nvim" }

    use("mfussenegger/nvim-dap")

    use("christoomey/vim-tmux-navigator")

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' }, -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, { 'hrsh7th/cmp-buffer' }, { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' }, { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' }, -- Snippets
            { 'L3MON4D3/LuaSnip' }, { 'rafamadriz/friendly-snippets' }
        }
    }

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
end)
