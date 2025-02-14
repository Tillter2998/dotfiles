return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters = {
          prettierd = {
            command = "prettierd",
            timeout_ms = 10000
          }
        },
        formatters_by_ft = {
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          markdown = { "prettierd" },
          html = { "prettierd" },
          css = { "prettierd" },
          scss = { "prettierd" },
          go = { "gofumpt" },
          vue = { "prettierd" }
        },
        default_format_opts = {
          lsp_format = "fallback"
        }
      })
    end,
  }
}
