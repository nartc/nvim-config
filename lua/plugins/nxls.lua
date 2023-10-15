return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        nxls = {},
      },
      setup = {
        nxls = function(_, opts)
          local cmd = { "nxls", "--stdio" }
          local util = require("lspconfig.util")
          opts.default_config = {
            cmd = cmd,
            filetypes = { "json", "jsonc" },
            root_dir = util.root_pattern("nx.json", ".git"),
            settings = {},
          }
        end,
      },
    },
  },
}
-- local configs = require 'lspconfig.configs'
-- local util = require 'lspconfig.util'
--
-- -- Check if it's already defined for when reloading this file.
-- if not configs.nxls then
--   local bin_name = 'nxls'
--   local cmd = { bin_name, '--stdio' }
--
--   if vim.fn.has 'win32' == 1 then
--     cmd = { 'cmd.exe', '/C', bin_name, '--stdio' }
--   end
--
--   configs.nxls = {
--     default_config = {
--       cmd = cmd;
--       filetypes = { 'json', 'jsonc' },
--       root_dir = util.root_pattern('nx.json', '.git'),
--       settings = {}
--     }
--   }
--
-- end
--
-- require "lvim.lsp.manager".setup "nxls"
