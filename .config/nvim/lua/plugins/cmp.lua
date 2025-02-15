return {
  {
    "hrsh7th/nvim-cmp",           -- Main completion plugin
    enabled = false,
    event = "InsertEnter",        -- Lazy-load when entering Insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP completions
      "hrsh7th/cmp-buffer",       -- Buffer completions
      "hrsh7th/cmp-path",         -- Path completions
      "hrsh7th/cmp-cmdline",      -- Command-line completions
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "rafamadriz/friendly-snippets"
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      -- Load snippets from VSCode-style snippet collections (optional)
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Configure nvim-cmp
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Use LuaSnip for snippets
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept the selected suggestion or snippet
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()   -- Navigate to the next item in the suggestion list
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- Expand or jump to the next placeholder in a snippet
            else
              fallback()               -- Default Tab behavior
            end
          end, { "i", "s" }),          -- `i` for Insert mode, `s` for Select mode
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Navigate to the previous item in the suggestion list
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)       -- Jump to the previous placeholder in a snippet
            else
              fallback()             -- Default Shift-Tab behavior
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP completions
          { name = "luasnip" },  -- Snippet completions
        }, {
          { name = "buffer" },   -- Buffer completions
          { name = "path" },     -- Path completions
        }),
      }

      -- Setup for command-line completion
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      })
    end,
  }
}
