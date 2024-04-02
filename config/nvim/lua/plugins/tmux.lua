return {
  "christoomey/vim-tmux-navigator",
  -- lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<c-h>", "<cmd> TmuxNavigateLeft<cr>" },
    { "<c-l>", "<cmd> TmuxNavigateRight<cr>" },
    { "<c-j>", "<cmd> TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd> TmuxNavigateUp<cr>" },
  },
}
