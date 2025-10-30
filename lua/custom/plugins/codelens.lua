-- lua/custom/plugins/codelens.lua
return {
  -- A “dummy” name so Lazy treats this as a plugin.
  -- No real repo is pulled; you could also set `dir = vim.fn.stdpath("config")`
  -- if you prefer.
  dir = vim.fn.stdpath 'config',
  name = 'codelens',
  event = 'LspAttach', -- load only when an LSP client attaches
  config = function()
    local group = vim.api.nvim_create_augroup('codelens_refresh', { clear = true })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = group,
      callback = function(args)
        local buf = args.buf
        local function map(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, { buffer = buf, desc = desc })
        end
        map('<leader>lcr', vim.lsp.codelens.refresh, 'CodeLens: refresh')
        map('<leader>lcl', vim.lsp.codelens.run, 'CodeLens: run')

        vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
          group = group,
          buffer = buf,
          callback = vim.lsp.codelens.refresh,
        })
      end,
    })
  end,
}
