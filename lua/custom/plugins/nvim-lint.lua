-- nvim-lint: Linting plugin for additional diagnostics
-- Configured to use ruff for Python linting
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    -- Configure linters by filetype
    lint.linters_by_ft = {
      python = { 'ruff' },
    }

    -- Create autocommand to trigger linting
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only lint if the linter binary is available
        if vim.fn.executable('ruff') == 1 then
          require('lint').try_lint()
        end
      end,
    })
  end,
}
