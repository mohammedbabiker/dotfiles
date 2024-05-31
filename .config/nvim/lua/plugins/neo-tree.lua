return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<leader>ne", "<CMD>Neotree filesystem reveal left<CR>", desc = "Open neotree" },
		{ "<leader>nt", "<CMD>Neotree buffers reveal float<CR>", desc = "Open neotree float" },
		{ "<leader>nc", "<CMD>Neotree close<CR>", desc = "Close neotree" },
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}
