return {
  { "marilari88/twoslash-queries.nvim" },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      setup = {
        tsserver = function(_, opts)
          opts.on_attach = function(client, bufnr)
            require("twoslash-queries").attach(client, bufnr)
          end
        end,
      },
    },
  },
}
