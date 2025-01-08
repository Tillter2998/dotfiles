local function delete_buffer()
  local current_buffer = vim.api.nvim_get_current_buf()
  local buffer_list = vim.fn.getbufinfo({ buflisted = 1 })
  local nvim_tree_buffer = nil
  -- local previousBuf = nil

  -- Find nvim tree buffer
  for _, buf in ipairs(buffer_list) do
    if buf.name:match("NvimTree_") then
      nvim_tree_buffer = buf.bufnr
      break
    end
  end

  vim.cmd("bp")
  -- previousBuf = vim.api.nvim_get_current_buf()

  if vim.api.nvim_get_current_buf() == nvim_tree_buffer then
    vim.cmd("enew")
  end

  vim.cmd("bd!" .. current_buffer)
end

return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup {
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true -- use a "true" to enable the default, or set your own character
            }
          },
        }
      }

      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
      vim.keymap.set("n", "<leader>x", delete_buffer, { noremap = true, silent = true })
    end,
  },
}
