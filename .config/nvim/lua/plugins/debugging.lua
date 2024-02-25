return {
	"mfussenegger/nvim-dap",
	keys = { -- load only when click on keys
		{ "<leader>dt", "<CMD>DapToggleBreakpoint<CR>" },
		{ "<leader>dc", "<CMD>DapContinue<CR>" },
		{ "<F10>", "<CMD>DapStepOver<CR>" },
		{ "<F12>", "<CMD>DapStepOut<CR>" },
	},
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
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
