vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>b', vim.cmd.Ex)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")


map.set("v", "K", ":m '<-2<CR>gv=gv")
map.set("i", "<C-c>", "<Esc>l")
map.set("i", "kj", "<Esc>l")
map.set("n", "J", "mzJ`z")
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

map.set("x", "p", "\"_dP")

map.set("n", "y", "\"+y")
map.set("v", "y", "\"+y")
map.set("v", "Y", "\"+y")
map.set("n", "Y", "\"+Y")

map.set("n", "d", "\"_d")
map.set("v", "d", "\"_d")
map.set("n", "dd", "\"_dd")
map.set("v", "dd", "\"_dd")
map.set("n", "x", "\"_x")
map.set("v", "x", "\"_x")
map.set("n", "c", "\"+x")
map.set("v", "c", "\"+x")
map.set("n", "Q", "<nop>")
