return {
	"mfussenegger/nvim-dap",
	keys = { -- load only when click on keys
		{ "<leader>dt", "<CMD>DapToggleBreakpoint<CR>", desc = "Toggle break point" },
		{ "<leader>dc", "<CMD>DapContinue<CR>", desc = "Dap continue" },
		{ "<leader>ds", "<CMD>DapStepOver<CR>", desc = "Dap step over" },
		{ "<leader>di", "<CMD>DapStepInto<CR>", desc = "Dap step into" },
		{ "<leader>do", "<CMD>DapStepOut<CR>", desc = "Dap step out" },
	},
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	-- {
	--   "mxsdev/nvim-dap-vscode-js",
	--   dependencies = { "mfussenegger/nvim-dap" },
	-- },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dap-go").setup()
		require("dapui").setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
