return {
  {
    "tamago324/nlsp-settings.nvim",
    opts = function(_, opts)
      opts.config_home = vim.fn.stdpath("config") .. "/nlsp-settings"
      opts.local_settings_dir = ".nlsp-settings"
      opts.local_settings_root_markers_fallback = { ".git" }
      opts.append_default_schemas = true
      opts.loader = "json"

      local lspconfig = require("lspconfig")

      local global_capabilities = vim.lsp.protocol.make_client_capabilities()
      global_capabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
        capabilities = global_capabilities,
      })
    end,
  },
}
