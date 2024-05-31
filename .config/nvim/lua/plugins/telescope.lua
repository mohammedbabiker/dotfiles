return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true, -- we let telescope load this for us
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local action = require("telescope.actions")

      require("telescope").setup({

        defaults = {
          path_display = { "smart" }, -- shorten path
          mappings = {
            i = {
              ["<C-j>"] = action.move_selection_next,
              ["<C-k>"] = action.move_selection_previous,
              ["<C-q>"] = action.send_selected_to_qflist + action.open_qflist,
            },
          },
        },
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

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ hidden = true })
      end, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fc", function()
        builtin.commands(require("telescope.themes").get_dropdown({
          previewer = false,
        }))
      end, { desc = "search commands" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" }) -- cd $HOME/dotfiles |
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })
      vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search in help" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "show buffers" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
