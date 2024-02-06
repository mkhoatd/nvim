vim.g.mapleader = " "
local map = vim.keymap

map.set("n", "<leader>pv", vim.cmd.Ex)

map.set("v", "J", ":m '>+1<CR>gv=gv")
map.set("v", "K", ":m '<-2<CR>gv=gv")

map.set("n", "J", "mzJ`z")
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

map.set("x", "<leader>p", "\"_dP")

map.set("n", "<leader>y", "\"+y")
map.set("v", "<leader>y", "\"+y")
map.set("v", "<leader>Y", "\"+y")
map.set("n", "<leader>Y", "\"+Y")

map.set("n", "<leader>d", "\"_d")
map.set("v", "<leader>d", "\"_d")
map.set("n", "<leader>x", "\"_d")
map.set("v", "<leader>x", "\"_d")

map.set("i", "<C-c>", "<Esc>")

map.set("n", "Q", "<nop>")
map.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)
map.set("n", "<leader>rn", vim.lsp.buf.rename)


map.set("n", "<C-k>", "<cmd>cnext<CR>zz")
map.set("n", "<C-j>", "<cmd>cprev<CR>zz")
map.set("n", "<leader>k", "<cmd>lnext<CR>zz")
map.set("n", "<leader>j", "<cmd>lnext<CR>zz")
