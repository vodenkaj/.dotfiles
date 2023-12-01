return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("nyoom-engineering/oxocarbon.nvim")
    use("norcalli/nvim-colorizer.lua")

    use {
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    }

    use("onsails/lspkind-nvim")
    use("kyazdani42/nvim-web-devicons")

    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")

    use("tpope/vim-surround")

    use { "NeogitOrg/neogit", requires = { "sindrets/diffview.nvim" } }

    use("lewis6991/gitsigns.nvim")
    use("mbbill/undotree")
    use("lukas-reineke/indent-blankline.nvim")

    use("mfussenegger/nvim-dap")

    use("christoomey/vim-tmux-navigator")

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim', run = ":MasonUpdate" },
            { 'elixir-tools/elixir-tools.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' }
        }
    }

    -- Remove the `use` here if you're using folke/lazy.nvim.
    use {
        'Exafunction/codeium.nvim',
        config = function()
            require("codeium").setup()
        end
    }

    use {
        "jay-babu/mason-nvim-dap.nvim",
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use("chrisbra/csv.vim")
    use("nvim-tree/nvim-tree.lua")

    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = function()
            require("fidget").setup {
                -- options
            }
        end,
    }
    use({'creativenull/efmls-configs-nvim'})
end)
