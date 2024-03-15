return {
  "neovim/nvim-lspconfig",
  init = function()
    local ok, wf = pcall(require, "vim.lsp._watchfile")
    if ok then
      -- disable lsp watcher. Too slow on linux
      wf._watchfunc = function()
        return function() end
      end
    end
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    local builtin = require("telescope.builtin")
    -- change a keymap
    keys[#keys + 1] = { "gI", builtin.lsp_implementations }
  end,
}
