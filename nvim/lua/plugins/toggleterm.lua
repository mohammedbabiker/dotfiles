return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>tl", "<cmd>ToggleTerm<cr>" },
  },
  opts = {
    size = 13,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1",
    start_in_insert = true,
    persist_size = true,
    -- direction = "float",
    direction = "horizontal",
  },
}
