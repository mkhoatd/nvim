vim.g.mapleader = " "
local map = vim.keymap

map.set("n", "<leader>b", vim.cmd.Ex)

map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

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

map.set("n", "<C-v>", "\"+p")
map.set("i", "<C-v>", "\"+p")
map.set("n", "p", "\"+p")
map.set("v", "p", "\"+p")

map.set("i", "<C-c>", "<Esc>l")
map.set("i", "kj", "<Esc>l")

map.set("n", "Q", "<nop>")
map.set("n", "<leader>rn", vim.lsp.buf.rename)

--[[ map.set("n", "<C-k>", "<cmd>cnext<CR>zz")
map.set("n", "<C-j>", "<cmd>cprev<CR>zz") ]]
map.set("n", "<leader>k", "<cmd>lnext<CR>zz")
map.set("n", "<leader>j", "<cmd>lnext<CR>zz")

map.set('t', 'kj', '<C-\\><C-n>')
map.set('t', '<Esc>', '<C-\\><C-n>')

