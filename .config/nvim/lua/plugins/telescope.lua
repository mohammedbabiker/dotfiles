return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = true, -- we let telescope load this for us
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				file_ignore_patterns = {
					"node_modules",
					"yarn.lock",
					".git",
					".sl",
					"_build",
					".next",
				},
				hidden = true,
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>lg", builtin.live_grep, {}) -- cd $HOME/dotfiles |
			vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
			vim.keymap.set("n", "<leader>fg", builtin.git_files, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
