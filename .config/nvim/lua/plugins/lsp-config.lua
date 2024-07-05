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
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          -- "svelte",
          "lua_ls",
          "emmet_ls",
          "eslint",
          "jsonls",
          "pyright",
          "dockerls",
          "yamlls",
        },
      })
    end
  },
  -- LSP config keybindings and setup for different languages
  {
    "neovim/nvim-lspconfig",
    -- load lsp config when reading a buffer or creating a new one
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local opts = { noremap = true, silent = true }
      local on_attach = function(client, bufnr) -- (client, bufnr)
        opts.buffer = bufnr
        opts.client = client
      end
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
        }
        vim.lsp.buf.execute_command(params)
      end

      local lspconfig = require("lspconfig") -- language server
      lspconfig.tsserver.setup({             -- javascript
        capabilites = capabilities,
        on_attach = on_attach,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "organize Imports",
          },
        },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNamaHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayVariableTypeHints = true,
            }
          },
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNamaHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayVariableTypeHints = true,
            }
          }
        }
      })
      lspconfig.html.setup({ -- html
        capabilites = capabilities,
        on_attach = on_attach,
      })
      lspconfig.lua_ls.setup({ -- lua
        capabilites = capabilities,
        on_attach = on_attach,
        setting = {
          lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                -- runtime file path
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
      lspconfig.cssls.setup({ -- css
        capabilites = capabilities,
        on_attach = on_attach,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.tailwindcss.setup({
        capabilites = capabilities,
        on_attach = on_attach,
      })
      lspconfig.jsonls.setup({
        capabilites = capabilities,
        on_attach = on_attach,
      })
      lspconfig.emmet_ls.setup({
        capabilites = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        }
      })
      lspconfig.pyright.setup({
        capabilites = capabilities,
        on_attach = on_attach,
        filetypes = { "python" },
      })
      -- configure svelte server
      -- lspconfig.svelte.setup({
      --   capabilities = capabilities,
      --   on_attach = function(client, bufnr)
      --     on_attach(client, bufnr)
      --
      --     vim.api.nvim_create_autocmd("BufWritePost", {
      --       pattern = { "*.js", "*.ts" },
      --       callback = function(ctx)
      --         if client.name == "svelte" then
      --           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
      --         end
      --       end,
      --     })
      --   end,
      -- })
      lspconfig.dockerls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })

      opts.desc = "Show documentation for what is under cursor"
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", "<CMD>Telescope lsp_references<CR>", {}) -- show definition, references
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Open code actions" })
      vim.keymap.set("n", "<leader>gn", vim.lsp.buf.rename, { desc = "Rename" })
    end,
  },
}
