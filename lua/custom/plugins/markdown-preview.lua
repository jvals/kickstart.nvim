return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  init = function()
    vim.g.mkdp_browser = 'firefox'
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0 -- live refresh as you edit
  end,
}
