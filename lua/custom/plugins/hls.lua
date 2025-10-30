return {
  -- piggy‑back on the existing lspconfig spec so opts get merged
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      hls = {
        mason = false, -- do not use mason to install haskell-language-server
        cmd = { vim.fn.expand '~/.ghcup/bin/haskell-language-server-wrapper', '--lsp' },
        filetypes = { 'hs', 'haskell', 'lhaskell', 'cabal' },
        autostart = true,
        root_dir = function(fname)
          local util = require 'lspconfig.util'
          return util.root_pattern('*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml', '.git')(fname) or util.path.dirname(fname)
        end,
        vim.lsp.enable 'hls',
        settings = {
          haskell = {
            formattingProvider = 'ormolu',
            cabalFormattingProvider = 'cabalfmt',
            plugin = {
              ['ghcide-code-actions-type-signatures'] = { globalOn = true },
              ['ghcide-type-lenses'] = {
                globalOn = true,
                config = { mode = 'always' },
              },
            },
          },
        },
      },
    },
  },
}
