-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.o.guifont = "JetbrainsMono Nerd Font:h10"
  vim.g.transparency = 0.9
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_window_blurred = true
end
