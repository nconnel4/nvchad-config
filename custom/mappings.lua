---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<leader>ts"] = { "<cmd>NeotestSummary<cr>", "toggle Neotest summary" },
		["<leader>tr"] = { "<cmd>Neotest<cr>", "run tests" },
		["<leader>to"] = { "<cmd>NeotestOutput<cr>", "toggle Neotest output" },
	},
}

-- more keybinds!

return M
