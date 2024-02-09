return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>t", desc = "Trouble" },
    { "<leader>w", "<CMD>TroubleToggle workspace_diagnostics<CR>" },
    { "<leader>d", "<CMD>TroubleToggle document_diagnostics<CR>" },
    { "<leader>f", "<CMD>TroubleToggle quickfix<CR>" },
  },
  otps = {
    use_diagnostic_signs = true,
    action_keys = {
      close = { "q", "<esc>" },
      cancel = "<C-e>",
    },
  },
}
