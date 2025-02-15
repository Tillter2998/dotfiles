return {
  {
    "stevearc/conform.nvim",
    -- enabled = false,
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          go = { "gofumpt" },
          vue = { "prettier" },
        },
        default_format_opts = {
          lsp_format = "fallback"
        }
      })
    end,
  }
}
