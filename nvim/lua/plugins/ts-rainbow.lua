return {
  "HiPhish/nvim-ts-rainbow2",
  event = "VeryLazy",
  require('nvim-treesitter.configs').setup({
    highlight = {
    },
    rainbow = {
      enable = true,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: language -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- dolors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings  
    },
  })
}
