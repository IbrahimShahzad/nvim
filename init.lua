--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]
vim.wo.relativenumber = true

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

---@class parser_config
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.kamailio_cfg = {
  install_info = {
    -- url = 'https://github.com/IbrahimShahzad/tree-sitter-kamailio-cfg', -- local path or git repo
    url = '~/personal/tree-sitter-kamailio-cfg', -- local path or git repo
    files = { 'src/parser.c' }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    -- branch = 'main', -- default branch in case of git repo if different from master
    -- branch = 'v0.1.0', -- default branch in case of git repo if different from master
    branch = 'v0.1.2', -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = 'kamailio', -- if filetype does not match the parser name
}
vim.treesitter.language.register('kamailio_cfg', 'cfg')

local client = vim.lsp.start_client {
  cmd = { '/Users/ibrahim.shahzad/personal/KamaiZen/KamaiZen' }, -- update this path
  name = 'KamaiZen',
  settings = {
    kamaizen = {
      logLevel = 1,
      kamailioSourcePath = '/Users/ibrahim.shahzad/office/bitbucket/kamailio_ims/',
      enableDeprecatedCommentHint = false,
    },
  },
}

if not client then
  vim.notify('Failed to start LSP client', vim.log.levels.ERROR)
  return
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'kamailio',
  callback = function()
    vim.lsp.buf_attach_client(0, client)
  end,
})
-- local client = vim.lsp.start_client {
--   name = 'KamaiZen',
--   cmd = { '/Users/ibrahim.shahzad/personal/KamaiZen/KamaiZen' },
-- }
--
-- if not client then
--   vim.notify 'KamaiZen failed to connect'
--   return
-- end
--
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'kamailio',
--   callback = function()
--     vim.lsp.buf_attach_client(0, client)
--   end,
-- })
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
