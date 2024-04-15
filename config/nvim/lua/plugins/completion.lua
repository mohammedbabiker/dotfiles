return {
  {
    "L3MON4D3/LuaSnip",
    lazy = true, -- we let nvim-cmp load this too
    dependencies = {
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      -- "Exafunction/codeium.nvim",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true, -- we let nvim-cmp load this for us
    config = true,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- load cmp after entering insert mode
    -- lazy = false,
    dependencies = {
      "hrsh7th/cmp-buffer", -- for buffer completion text
      "hrsh7th/cmp-path",   -- for file path completion
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        window = {
          documentation = cmp.config.window.bordered(),
          completion = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous autosuggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next autosuggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          -- { name = "codeium" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
        -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })
    end,
  },
}
