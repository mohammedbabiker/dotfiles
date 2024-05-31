return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<leader>tth", ":ToggleTerm dir=~ direction=horizontal<CR>", desc = "H terminal" },
		{ "<leader>ttv", ":ToggleTerm size=60 dir=~ direction=vertical<CR>", desc = "V terminal" },
		{ "<leader>ttf", ":ToggleTerm dir=~ direction=float<CR>", desc = "F terminal" },
		{ "<leader>ttt", ":ToggleTerm dir=~ direction=tab<CR>", desc = "Tab terminal" },
	},
	opts = {
		size = 13,
		open_mapping = [[<c-\>]],
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = "1",
		start_in_insert = true,
		persist_size = true,
		-- direction = "float",
		-- direction = "horizontal",
	},
}
