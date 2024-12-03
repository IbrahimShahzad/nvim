-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Obsidian Key maps
vim.keymap.set('n', '<leader>onn', '<cmd>ObsidianNew<CR>', { desc = 'Create [O]bsidian [N]ew [N]ote' })
vim.keymap.set('n', '<leader>ont', '<cmd>ObsidianNewFromTemplate<CR>', { desc = 'Create [O]bsidian [N]ew note from [T]emplate' })
vim.keymap.set('n', '<leader>onl', '<cmd>ObsidianLinkNew<CR>', { desc = 'Create [O]bsidian [N]ew [L]ink from visual selection' })
vim.keymap.set('n', '<leader>orn', '<cmd>ObsidianRename<CR>', { desc = '[O]bsidian [R]ename [N]ote' })
vim.keymap.set('n', '<leader>ow', '<cmd>ObsidianWorkspace<CR>', { desc = 'Choose [O]bsidian [W]orskspace' })
vim.keymap.set('n', '<leader>opi', '<cmd>ObsidianPasteImg<CR>', { desc = '[O]bsidian [P]aste [I]mage' })
vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', { desc = '[O]bsidian [O]pen App' })
vim.keymap.set('n', '<leader>sog', '<cmd>ObsidianSearch<CR>', { desc = '[S]earch [O]bsidian note [G]rep' })
vim.keymap.set('n', '<leader>sot', '<cmd>ObsidianTags<CR>', { desc = '[S]earch [O]bsidotan [T]ags' })
vim.keymap.set('n', '<leader>sol', '<cmd>ObsidianLinks<CR>', { desc = '[S]earch [O]bsidian [L]inks' })

-- Tabs
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = '[S]earch [O]bsidian [L]inks' })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
