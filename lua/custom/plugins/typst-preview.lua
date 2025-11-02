return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- Load immediately for better user experience
  version = '1.*',
  ft = 'typst',
  opts = {
    follow_cursor = true,
    dependencies_bin = {
      ['tinymist'] = nil, -- Will use the tinymist LSP already configured
    },
  },
}
