return {
  "mfussenegger/nvim-dap",
  keys = { -- load only when click on keys
    { "<leader>dt", "<CMD>DapToggleBreakpoint<CR>" },
    { "<leader>dc", "<CMD>DapContinue<CR>" }
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

    --vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    --vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  end,
}
