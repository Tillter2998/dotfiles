return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go"
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
      require("dap-go").setup()
      require("config.dapui")
      vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
      vim.keymap.set('n', '<F8>', '<cmd>lua require"dap".step_over()<CR>', opts)
      vim.keymap.set('n', '<F7>', '<cmd>lua require"dap".step_into()<CR>', opts)
      vim.keymap.set('n', '<F9>', '<cmd>lua require"dap".step_out()<CR>', opts)
    end
  }
}
