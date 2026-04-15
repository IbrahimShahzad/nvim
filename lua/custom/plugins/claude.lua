return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  config = true,
  keys = {
    { '<leader>x', nil, desc = 'AI/Claude Code' },
    { '<leader>xt', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { '<leader>xf', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
    { '<leader>xr', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { '<leader>xC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { '<leader>xm', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { '<leader>xb', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { '<leader>xs', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      '<leader>xs',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },
    -- Diff management
    { '<leader>xa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { '<leader>xd', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
  },
}
