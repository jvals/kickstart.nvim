return {
  -- piggy‑back on the existing lspconfig spec so opts get merged
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      hls = {
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
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
