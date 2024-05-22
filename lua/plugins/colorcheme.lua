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
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
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
