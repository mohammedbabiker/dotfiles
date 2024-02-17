return {
  "folke/which-key.nvim",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  enabled = true,
  keys = { "<leader>" },
  event = { "InsertEnter" },

  opts = {
    plugins = {
      spelling = {
        eneble = true,
        suggestions = 20
      },
    }
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
