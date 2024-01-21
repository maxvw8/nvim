vim.g.mapleader = ' '


-- Remove search highlight
vim.keymap.set('n', '<ESC><ESC>', ':noh<CR>', { silent = true })
vim.keymap.set('n', '<C-c><C-c>', ':noh<CR>', { silent = true })

-- x does not overwrite yank buffer
vim.keymap.set('n', 'x', '"_x', { silent = true })

-- Easily yank to and paste from system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"*y', { silent = true })
-- vim.keymap.set('n', '<leader>p', '"*p')

-- Open nvim config
-- vim.keymap.set('n', '<leader>v', ':e ~/.config/nvim/init.lua<CR>')

-- Search centers result
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
-- Movement centers result
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Switch windows
--vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
--vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
--vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
--vim.keymap.set('n', '<C-h>', '<C-w><C-h>')

