return {
  "folke/noice.nvim",
  opts = function(_, opts)
    -- local test_opts = opts
    -- vim.list_extend(opts.routes, {
    --   {
    --     {
    --       filter = {
    --         event = "notify",
    --         find = "No information available",
    --       },
    --       opts = { skip = true },
    --     },
    --     {
    --       filter = {
    --         event = "ionide",
    --         find = "Checking unused opens",
    --       },
    --       opts = { skip = true },
    --     },
    --     {
    --       filter = {
    --         event = "fsautocomplete",
    --         find = "Checking unused declarations",
    --       },
    --       opts = { skip = true },
    --     },
    --   },
    -- })
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })
  end,
}
