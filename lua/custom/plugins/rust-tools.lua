return {
  'simrat39/rust-tools.nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  ft = 'rust',
  init = function()
    local rt = require 'rust-tools'
    rt.setup {
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },
      tools = {
        autoSetHints = true,
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = '🤔 ',
          other_hints_prefix = '🔍 ',
        },
      },
    }
  end,
}
