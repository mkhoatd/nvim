-- since this is just an example spec, don't actually load anything here and return an empty spec
--

return {
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<CR>", false },
      { "<S-CR>", false },
      { "<CR>", vim.NIL },
      { "<S-CR>", vim.NIL },
    },
    dependencies = {
      "hrsh7th/cmp-path",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      for i, v in ipairs(opts.sources) do
        if v.name == "path" then
          opts.sources[i] = {
            name = "path",
            option = {
              get_cwd = function(params)
                return vim.fn.getcwd()
              end,
            },
          }
        end
      end
      local newMapping = {}
      for k, v in pairs(opts.mapping) do
        if k ~= "<CR>" then
          newMapping[k] = v
        end
      end
      opts.mapping = newMapping
      -- opts.mapping = newMapping
    end,
  },
}
