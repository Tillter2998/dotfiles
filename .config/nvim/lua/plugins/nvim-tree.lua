return {
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 40,
        },
      })
      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
}
