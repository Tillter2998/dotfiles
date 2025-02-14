return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "mxsdev/nvim-dap-vscode-js"
    },
    config = function()
      local dap = require("dap")

      require("dap-vscode-js").setup({
        -- node_path = "node",                                                                          -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        debugger_path = vim.fn.stdpath("data") .. "/dap/vscode-js-debug",                            -- Path to vscode-js-debug installation.
        -- debugger_cmd = { "js-debug-adapter" },                                                       -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log",                                         -- Path for file logging
        -- log_file_level = false,                                                                      -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels
        -- .ERROR                                                                                   -- Logging level for output to console. Set to false to disable console output.
      })

      -- Add JavaScript/TypeScript debugger configurations
      for _, language in ipairs({ "typescript", "javascript" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/jest/bin/jest.js",
              "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          }
        }
      end
    end
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
