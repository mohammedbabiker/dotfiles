return {
	"mg979/vim-visual-multi",
	event = { "BufReadPre", "BufNewFile" }, -- load when a buffer is opened or created
	branch = "master",
	init = function()
		vim.g.VM_maps = {
			["Find Under"] = "<C-d>",
		}
	end,
}
