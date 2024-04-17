return {
  {
    "tpope/vim-fugitive",
    event = { "BufReadPre", "BufNewFile" }, -- load the plugin when entering a buffer
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- load the plugin when entering a buffer
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        current_line_blame = false, -- show by <leader>gt
      })

      vim.keymap.set("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", "<CMD>Gitsigns toggle_current_line_blame<CR>", {})
      vim.keymap.set("n", "<leader>gf", "<CMD>Gitsigns diffthis<CR>", {})
    end,
  },
}
