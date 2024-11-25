-- splits navigator
vim.keymap.set('n', '<C-S-k>', '<CMD>vsplit<CR>')
vim.keymap.set('n', '<C-S-l>', '<CMD>split<CR>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- no skipping sentences
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
