vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local buf = args.buf
    local map = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = buf, desc = desc })
    end

    map('<leader>lcr', vim.lsp.codelens.refresh, 'CodeLens: refresh')
    map('<leader>lcl', vim.lsp.codelens.run, 'CodeLens: run')

    vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
      buffer = buf,
      callback = vim.lsp.codelens.refresh,
    })
  end,
})
