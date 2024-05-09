return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "html",
        "yaml",
        "angular",
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  { "nvim-treesitter/playground" },
}
