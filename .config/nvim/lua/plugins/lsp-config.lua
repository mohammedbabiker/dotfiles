return {
  -- Install the language server with Mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason", -- load mason when running :Mason command
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  -- Enable communications between LSP config and Mason
  {
    "williamboman/mason-lspconfig.nvim",
    -- event = "VeryLazy", -- load this after critical plugins
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  -- LSP config keybindings and setup for different languages
  {
    "neovim/nvim-lspconfig",
    -- load lsp config when reading a buffer or creating a new one
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig") -- language server
      lspconfig.tsserver.setup({             -- javascript
        capabilites = capabilities,
      })
      lspconfig.html.setup({ -- html
        capabilites = capabilities,
      })
      lspconfig.lua_ls.setup({ -- lua
        capabilites = capabilities,
      })
      lspconfig.cssls.setup({ -- css
        capabilites = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilites = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilites = capabilities,
      })

      vim.keymap.set("n", "I", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
