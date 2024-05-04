-- since this is just an example spec, don't actually load anything here and return an empty spec
--

local border = {
  { "╭", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╮", "CmpBorder" },
  { "│", "CmpBorder" },
  { "╯", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╰", "CmpBorder" },
  { "│", "CmpBorder" },
}


return {
  {
    "hrsh7th/nvim-cmp",
    keys = {
      { "<CR>",   false },
      { "<S-CR>", false },
      { "<CR>",   vim.NIL },
      { "<S-CR>", vim.NIL },
    },
    dependencies = {
      "hrsh7th/cmp-path",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      opts.window = {
        completion = {
          border = border,
        }
      }
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
      -- --- @type cmp.SourceConfig
      -- local cody_src = {
      --   name = "cody",
      --   group_index = 1,
      --   priority = 100,
      -- }
      -- table.insert(opts.sources, 1, cody_src)
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
