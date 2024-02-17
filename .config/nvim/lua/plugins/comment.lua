return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- load the plugin when entering a buffer

  opts = {
    -- add any options here
  },
  -- lazy = false,
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
      },
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook = nil,
      post_hook = nil,
    })
  end
}
