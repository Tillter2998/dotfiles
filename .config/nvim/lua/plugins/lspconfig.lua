return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")
      lspconfig.lua_ls.setup { capabilities = capabilities }

      -- lspconfig.lua_ls.setup {}

      lspconfig.gopls.setup {
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            gofumpt = true,
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true
            },
          },
        },
      }

      lspconfig.volar.setup {
        capabilities = capabilities,
        -- add filetypes for typescript, javascript and vue
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        init_options = {
          vue = {
            -- disable hybrid mode
            hybridMode = false,
          },
        },
      }


      lspconfig.templ.setup {
        capabilities = capabilities
      }

      -- lspconfig.ts_ls.setup {
      --   capabilities = capabilities,
      --   -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
      --   -- init_options = {
      --   --   plugins = {
      --   --     {
      --   --       name = "@vue/typescript-plugin",
      --   --       location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
      --   --       languages = { "javascript", "typescript", "vue" },
      --   --     },
      --   --   },
      --   -- },
      --   -- filetypes = {
      --   --   "javascript",
      --   --   "typescript",
      --   --   "vue",
      --   -- },
      -- }
      -- lspconfig.vuels.setup {}
      require("custom.autocmds")
      vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          ---@diagnostic disable-next-line: missing-parameter
          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on saved
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                -- local fileType = vim.bo.filetype
                local conform = require("conform")
                conform.format({ bufnr = args.buf, id = client.id })
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end
  },
}
