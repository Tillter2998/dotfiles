require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Add breakpoint at line" })
map('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
map('n', '<F8>', '<cmd>lua require"dap".step_over()<CR>', opts)
map('n', '<F7>', '<cmd>lua require"dap".step_into()<CR>', opts)
map('n', '<F9>', '<cmd>lua require"dap".step_out()<CR>', opts)
map("n", "<Leader>dus",
  function()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
  end,
  { desc = "Open debugging sidebar" }
)
map("n", "<Leader>dgt", 
  function()
    require('dap-go').debug_test()
  end,
  { desc = "Debug go test" }
)
map("n", "<Leader>dgl", 
  function()
    require('dap-go').debug_last()
  end,
  { desc = "Debug last go test" }
)
map("n", "<Leader>gsj", "<cmd>GoTagAdd json<CR>", { desc = "Add json struct tags"})
map("n", "<Leader>gsy", "<cmd>GoTagAdd yaml<CR>", { desc = "Add yaml struct tags"})
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left"})
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right"})
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down"})
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up"})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
