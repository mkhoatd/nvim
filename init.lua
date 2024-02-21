require("mkhoatd")

vim.opt.swapfile = false

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h12"
    vim.g.neovide_window_blurred = true
--[[     vim.g.neovide_transparency = 0.95 ]]
    vim.g.neovide_floating_blur_amount_x = 20.0
    vim.g.neovide_floating_blur_amount_y = 20.0
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
end

