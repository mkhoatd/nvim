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
      local cmp = require("cmp")

      opts.window = {
        completion = {
          border = border,
        },
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end),
        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end),
      })
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
    end,
  },
}
