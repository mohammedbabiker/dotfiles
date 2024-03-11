return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	-- ft = "markdown",
	--  Only work on markdown in the path
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		"BufReadPre /Users/mohammedbabai/Documents/notion/**.md",
		"BufNewFile /Users/mohammedbabai/Documents/notion/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "notion",
				path = "/Users/mohammedbabai/Documents/notion",
			},
			-- {
			-- 	name = "Obcidian",
			-- 	path = "/Users/mohammedbabai/Documents/Obsidian",
			-- },
		},
		templates = {
			subdir = "Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			tags = "",
			substitutions = {
				yesterday = function()
					return os.date("%Y-%m-%d", os.time() - 86400)
				end,
				tomorrow = function()
					return os.date("%Y-%m-%d", os.time() + 86400)
				end,
			},
		},
		ui = {
			enable = true,
		},
	},

	vim.keymap.set(
		"n",
		"<leader>oc",
		"<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
		{ desc = "Obsidian Check Checkbox" }
	),

	vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" }),
	vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" }),
	vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" }),
	vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" }),
	vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" }),
	vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" }),
	vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" }),
}
