return {
	"folke/noice.nvim",
	dependencies = {
		"rcarriga/nvim-notify",
		"MunifTanjim/nui.nvim",
	},

	opts = {
		commands = {
			all = {
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {},
			},
		},
		routes = {
			{
				filter = { event = "notify", find = "No information available" },
				opts = { skip = true },
			},
		},
		presets = {
			lsp_doc_border = true,
		},
	},
}
