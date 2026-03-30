-- return {
--   'jose-elias-alvarez/null-ls.nvim',
--   event = 'VeryLazy',
--   opts = function()
--     local null_ls = require 'null-ls'
--     local opts = {
--       sources = { null_ls.builtins.formatting.clang_format },
--     }
--     return opts
--   end,
-- }
return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        -- require 'none-ls.diagnostics.eslint', -- requires none-ls-extras.nvim
      },
    }
  end,
}
