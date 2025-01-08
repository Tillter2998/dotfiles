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
vim.keymap.set("v", "<leader>w", ":'<,'>WrapSelected<CR>", { silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
