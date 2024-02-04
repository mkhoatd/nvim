local esc = vim.api.nvim_replace_termcodes(
	'<ESC>', true, false, true
)

vim.keymap.set("x", "<C-_>", function() 
	require('Comment.api').toggle.blockwise(vim.fn.visualmode())
end)


