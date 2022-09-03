return require('packer').startup(function(use)
    use("wbthomason/packer.nvim")
    use("EdenEast/nightfox.nvim")

    use("nvim-telescope/telescope.nvim")
    use("nvim-lua/plenary.nvim")

    use("neovim/nvim-lspconfig")
    use("onsails/lspkind-nvim")

    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use("stevearc/dressing.nvim")

    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")

    use("tpope/vim-surround")
    use("tpope/vim-fugitive")

    use("lewis6991/gitsigns.nvim")
    use("ThePrimeagen/harpoon")
    use("sbdchd/neoformat")
    use("mbbill/undotree")
end)
