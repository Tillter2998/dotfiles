return {
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      { 'L3MON4D3/LuaSnip', version = 'v2.*' }
    },

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    opts = {

      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true
          }
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        }
      },

      keymap = {
        --   preset = 'default',
        --
        --   ['<Tab>'] = { 'accept', 'fallback' },
        --   ['<Up>'] = { 'select_prev', 'fallback' },
        --   ['<Down>'] = { 'select_next', 'fallback' },
        --
        ['<C-space>'] = { 'show', 'fallback' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },

        -- = { 'snippet_forward', 'fallback' },
        -- = { 'snippet_backward', 'fallback' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      signature = { enabled = true },
      snippets = { preset = 'luasnip' },
      -- ensure you have the `snippets` source (enabled by default)
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },
}
