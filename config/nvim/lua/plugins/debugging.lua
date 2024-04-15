return {
  "mfussenegger/nvim-dap",
  keys = { -- load only when click on keys
    { "<leader>dt", "<CMD>DapToggleBreakpoint<CR>", desc = "Toggle break point" },
    { "<leader>dc", "<CMD>DapContinue<CR>",         desc = "Dap continue" },
    { "<leader>ds", "<CMD>DapStepOver<CR>",         desc = "Dap step over" },
    { "<leader>di", "<CMD>DapStepInto<CR>",         desc = "Dap step into" },
    { "<leader>do", "<CMD>DapStepOut<CR>",          desc = "Dap step out" },
    { "<leader>dx", "<CMD>DapTerminate<CR>",        desc = "Dap terminate" },
  },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mxsdev/nvim-dap-vscode-js",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    require("dapui").setup()
    require("dap-vscode-js").setup({
      -- debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
      debugger_path = "/Users/mohammedbabai/Developer/vscode-js-debug",
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    })

    local js_based_language = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

    for _, language in ipairs(js_based_language) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          trace = true,
          program = "${file}",
          cwd = "${workspaceFolder}",
          rootPath = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
          runtimeExecutable = "node",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        -- on server
        {
          type = "pwa-chrome",
          request = "launch",
          name = 'Start Chrome with "localhost"',
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
        },
      }
    end

    dap.listeners.after.event_initialized.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
  end,
}
