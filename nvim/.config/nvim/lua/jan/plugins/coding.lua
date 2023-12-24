return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		build = (not jit.os:find("Windows"))
				and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
			or nil,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							require("luasnip").expand_or_jump()
						else
							fallback()
						end
					end,
					["<S-Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							require("luasnip").jump(-1)
						else
							fallback()
						end
					end,
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "codium" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = function(_, item)
						local icons = require("jan.config").icons;
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end
						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				sorting = defaults.sorting,
			}
		end,
		---@param opts cmp.ConfigSchema
		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			require("cmp").setup(opts)
		end,
	},

	-- Fast and feature-rich surround actions. For text that includes
	-- surrounding characters like brackets or quotes, this allows you
	-- to select the text inside, change or modify the surrounding characters,
	-- and more.
	{
		"echasnovski/mini.surround",
		--keys = function(_, keys)
		--	-- Populate the keys based on the user's options
		--	--local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
		--	--local opts = require("lazy.core.plugin").values(plugin, "opts", false)
		--	local opts = {
		--		add = "gsa", -- Add surrounding in Normal and Visual modes
		--		delete = "gsd", -- Delete surrounding
		--		find = "gsf", -- Find surrounding (to the right)
		--		find_left = "gsF", -- Find surrounding (to the left)
		--		highlight = "gsh", -- Highlight surrounding
		--		replace = "gsr", -- Replace surrounding
		--		update_n_lines = "gsn", -- Update `n_lines`
		--	}
		--	local mappings = {
		--		{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
		--		{ opts.mappings.delete, desc = "Delete surrounding" },
		--		{ opts.mappings.find, desc = "Find right surrounding" },
		--		{ opts.mappings.find_left, desc = "Find left surrounding" },
		--		{ opts.mappings.highlight, desc = "Highlight surrounding" },
		--		{ opts.mappings.replace, desc = "Replace surrounding" },
		--		{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
		--	}
		--	mappings = vim.tbl_filter(function(m)
		--		return m[1] and #m[1] > 0
		--	end, mappings)
		--	return vim.list_extend(mappings, keys)
		--end,
		--opts = {
		--	mappings = {
		--		add = "gsa", -- Add surrounding in Normal and Visual modes
		--		delete = "gsd", -- Delete surrounding
		--		find = "gsf", -- Find surrounding (to the right)
		--		find_left = "gsF", -- Find surrounding (to the left)
		--		highlight = "gsh", -- Highlight surrounding
		--		replace = "gsr", -- Replace surrounding
		--		update_n_lines = "gsn", -- Update `n_lines`
		--	},
		--},
	},
}
