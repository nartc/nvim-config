return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    local cmp_window = require("cmp.config.window")
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    if opts.window ~= nil then
      opts.window.completion = cmp_window.bordered()
      opts.window.documentation = cmp_window.bordered()
    else
      opts.window = {
        completion = cmp_window.bordered(),
        documentation = cmp_window.bordered(),
      }
    end
  end,
}
