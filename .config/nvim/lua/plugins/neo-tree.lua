return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<C-a>",      "<CMD>Neotree toggle left<CR>" },
    { "<leader>nt", "<CMD>Neotree buffers reveal float<CR>" },
  },
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
}
