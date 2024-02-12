return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>tw", "<CMD>TroubleToggle workspace_diagnostics<CR>" },
    { "<leader>td", "<CMD>TroubleToggle document_diagnostics<CR>" },
    { "<leader>tf", "<CMD>TroubleToggle quickfix<CR>" },
  },
  otps = {
    use_diagnostic_signs = true,
    action_keys = {
      close = { "q", "<esc>" },
      cancel = "<C-e>",
    },
  },
}
