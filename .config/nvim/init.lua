-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

-- General key binds
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("n", "<leader><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<ESC>", "<cmd>noh<CR>")

-- Nvim Tree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

-- bufferline
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")

-- tmux navigator
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })

-- nvim-comment
vim.keymap.set("n", "<leader>/", "<cmd>CommentToggle<CR>")
vim.keymap.set("v", "<leader>/", ":'<,'>CommentToggle<CR>")

-- nvim-telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- dap/dapui
vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
vim.keymap.set('n', '<F8>', '<cmd>lua require"dap".step_over()<CR>', opts)
vim.keymap.set('n', '<F7>', '<cmd>lua require"dap".step_into()<CR>', opts)
vim.keymap.set('n', '<F9>', '<cmd>lua require"dap".step_out()<CR>', opts)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
