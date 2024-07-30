return {
  -- amongst your other plugins
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
        size = 20,
        direction = 'float',
        float_opts = {
          -- The border key is *almost* the same as 'nvim_open_win'
          -- see :h nvim_open_win for details on borders however
          -- the 'curved' border is a custom border type
          -- not natively supported but implemented in this plugin.
          border = 'curved',
          -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
          width = 80,
          height = 30,
          winblend = 3,
          title_pos = 'center',
        },
      }
    end,
  },
}
