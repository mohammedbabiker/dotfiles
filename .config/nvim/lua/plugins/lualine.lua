return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- load this plugin after critical plugins
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = { "filename" },
        lualine_b = { "branch", "diff", "diagnostics" },
        -- lualine_c = {
        --   {
        --     require("noice").api.statusline.mode.get,
        --     cond = require("noice").api.statusline.mode.has,
        --   },
        --   -- "mode",
        -- },
        lualine_x = {
          -- "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "fugitive", "lazy", "mason", "nvim-dap-ui" },
    })
  end,
}
