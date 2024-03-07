return {
	-- brew install silicon
	"michaelrommel/nvim-silicon",
	event = "BufReadPost",
	cmd = "Silicon",
	config = function()
		local silicon = require("silicon")
		silicon.setup({
			font = "Hack Nerd Font=34;Noto Emoji",
			theme = "Dracula",
			background = "#94e2d5",
			-- background = "#076678",
			-- the paddings to either side
			pad_horiz = 100,
			pad_vert = 80,
			no_round_corner = false,
			-- whether to put the close, minimize, maximise traffic light controls on the border
			no_window_controls = false,
			no_line_number = false,
			-- with which number the line numbering shall start, the default is 1, but here a
			-- function is used to return the actual source code line number
			line_offset = function(args)
				return args.line1
			end,
			-- the distance between lines of code
			line_pad = 0,
			-- the rendering of tab characters as so many space characters
			tab_width = 4,
			-- with which language the syntax highlighting shall be done, should be a function
			-- that returns either a language name or an extension like ".js"
			language = function()
				return vim.bo.filetype
			end,
			-- if the shadow below the os window should have be blurred
			shadow_blur_radius = 16,
			-- the offset of the shadow in x and y directions
			shadow_offset_x = 8,
			shadow_offset_y = 8,
			shadow_color = "#100808",
			-- whether to strip of superfluous leading whitespace
			gobble = true,

			output = function()
				return "./" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
			end,

			to_clipboard = false,

			command = "silicon",
			-- the title of the window
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
		})

		vim.keymap.set("v", "<leader>sc", ":Silicon<CR>")
	end,
}
