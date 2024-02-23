return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true, -- we let telescope load this for us
  },
  {
    'nvim-telescope/telescope.nvim',
    keys = { -- only load the plugin when these keys are pressed:
      { "<C-p>",      "<CMD>Telescope find_files<CR>" },
      { "<leader>lg", "<CMD>cd $HOME/dotfiles | Telescope live_grep<CR>" },
      { "<leader>of", "<CMD>Telescope oldfiles<CR>" },
      { "<leader>fs", "<CMD>Telescope grep_string<CR>"} -- Install ripgrep
    },
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        file_ignore_patterns = {
          "node_modules",
          "yarn.lock",
          ".git",
          ".sl",
          "_build",
          ".next",
        },
        hidden = true,
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
