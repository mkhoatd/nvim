return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  -- {
  --   "ray-x/starry.nvim",
  --   priority = 1000,
  --   config = function(_, opts)
  --     require("ray-x/starry.nvim").setup(opts or {})
  --     vim.g.starry_italic_comments = true
  --   end,
  -- },
}
