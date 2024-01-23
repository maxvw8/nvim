vim.g.mapleader = ' '


-- Remove search highlight
vim.keymap.set('n', '<Esc><Esc>', ':noh<CR>', { silent = true })
vim.keymap.set('n', '<C-c><C-c>', ':noh<CR>', { silent = true })

-- x does not overwrite yank buffer
vim.keymap.set('n', 'x', '"_x', { silent = true })

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Ctrl+c to esc
vim.keymap.set("i", "<C-c>", "<Esc>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- delete without saving in registry
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- copy without saving in registry
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Open nvim config
-- TODO: set working directory for fuzzi find to parent folder
-- vim.keymap.set('n', '<leader>vpp', ':e ~/.config/nvim/init.lua<CR>')

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
