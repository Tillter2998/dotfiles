return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
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
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")
      lspconfig.lua_ls.setup {}
      lspconfig.gopls.setup {
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
      lspconfig.ts_ls.setup {
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      }
      lspconfig.vuels.setup {}
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
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end
  },
}
