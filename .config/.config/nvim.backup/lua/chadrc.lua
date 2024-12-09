-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

M.ui = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}
M.plugins = {
  user = {
    ["ray-x/go.nvim"] = {
      config = function()
        require('go').setup()
        -- Auto format and import on save using gofumpt
        local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
            require('go.format').gofmt()
          end,
          group = format_sync_grp,
        })
      end,
    },
    ["ray-x/guihua.lua"] = { run = 'cd lua/fzy && make' },  -- required dependency
    ["nvim-treesitter/nvim-treesitter"] = {
      run = ":TSUpdate",
      config = function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = {"go", "lua", "javascript"}, -- add other languages you want to use
          highlight = {
            enable = true,
          },
        }
      end,
    },
  },
}


return M
