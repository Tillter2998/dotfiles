return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require ("nvchad.configs.lspconfig")
      require "configs.lspconfig"
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", "gomod"},
    build = ':lua require("go.install").update_all_sync()'
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("dap")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()
    end
  },
    --
   --{
   	--"nvim-treesitter/nvim-treesitter",
   	--opts = {
   	--	ensure_installed = {
   	--		"vim", "lua", "vimdoc",
     --   "html", "css", "gopls"
   		--},
   	--},
   --},
}
