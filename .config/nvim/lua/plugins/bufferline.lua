local function delete_current_buffer()
  local current_buf = vim.api.nvim_get_current_buf()
  local buf_list = vim.fn.getbufinfo({ buflisted = 1 })
  local nvim_tree_buf = nil

  -- Find Nvim Tree buffer, if open
  for _, buf in ipairs(buf_list) do
    if buf.name:match("NvimTree_") then
      nvim_tree_buf = buf.bufnr
      break
    end
  end

  -- Switch to the previous buffer
  vim.cmd("bprevious")

  -- Get the buffer after `:bprevious` runs
  local previous_buf = vim.api.nvim_get_current_buf()

  -- If the previous buffer is Nvim Tree, move to another buffer or create a new one
  if previous_buf == nvim_tree_buf or previous_buf == current_buf then
    for _, buf in ipairs(buf_list) do
      if buf.bufnr ~= current_buf and buf.bufnr ~= nvim_tree_buf then
        vim.api.nvim_set_current_buf(buf.bufnr)
        break
      end
    end
  end

  -- If no other buffers are available, create a new buffer
  if vim.api.nvim_get_current_buf() == nvim_tree_buf then
    vim.cmd("enew")     -- Create a new empty buffer
  end

  -- Finally, delete the current buffer
  vim.cmd("bdelete " .. current_buf)
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
      vim.keymap.set("n", "<leader>x", delete_current_buffer, { noremap = true, silent = true })
    end,
  },
}
