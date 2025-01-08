return {
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()

      vim.keymap.set("n", "<leader>/", "<cmd>CommentToggle<CR>")
      vim.keymap.set("v", "<leader>/", ":'<,'>CommentToggle<CR>")
    end
  },
}
