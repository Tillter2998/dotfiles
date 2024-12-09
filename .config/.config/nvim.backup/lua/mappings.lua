require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")

map('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
map('n', '<F8>', '<cmd>lua require"dap".step_over()<CR>', opts)
map('n', '<F7>', '<cmd>lua require"dap".step_into()<CR>', opts)
map('n', '<F9>', '<cmd>lua require"dap".step_out()<CR>', opts)
map('n', '<Leader>b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<Leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map('n', '<Leader>lp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts)
map('n', '<Leader>dr', '<cmd>lua require"dap".repl.open()<CR>', opts)
map('n', '<Leader>dl', '<cmd>lua require"dap".run_last()<CR>', opts)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
