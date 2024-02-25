return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<leader>ne", "<CMD>Neotree filesystem reveal left<CR>" },
		{ "<leader>nt", "<CMD>Neotree buffers reveal float<CR>" },
		{ "<leader>nc", "<CMD>Neotree close<CR>" },
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}
