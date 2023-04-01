local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- overrde plugin configs
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"nvim-neotest/neotest",
		cmd = { "Neotest", "NeotestSummary", "NeotestOutput" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"marilari88/neotest-vitest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python"),
					require("neotest-plenary"),
					require("neotest-vitest"),
				},
			})

			vim.api.nvim_create_user_command("Neotest", function()
				require("neotest").run.run(vim.fn.getcwd())
			end, {})

			vim.api.nvim_create_user_command("NeotestSummary", function()
				require("neotest").summary.toggle()
			end, {})

			vim.api.nvim_create_user_command("NeotestOutput", function()
				require("neotest").output_panel.toggle()
			end, {})
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- Uncomment if you want to re-enable which-key
	-- {
	--   "folke/which-key.nvim",
	--   enabled = true,
	-- },
}

return plugins
