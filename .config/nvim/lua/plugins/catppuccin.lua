return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavor = "mocha",
        integrations = {
          nvimtree = true,
        }
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
}
