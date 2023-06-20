return {
  {
    "MunifTanjim/prettier.nvim",
    bin = "prettierd",
    filetypes = {
      "css",
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "json",
      "markdown",
      "scss",
      "yaml",
      "lua",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
    end,
  },
}
