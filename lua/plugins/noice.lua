return {
  "folke/noice.nvim",
  -- TODO: remove when PR is merged: https://github.com/folke/noice.nvim/pull/785
  url = "https://github.com/wookayin/noice.nvim.git",
  branch = "lsp-progress",
  opts = function(_, opts)
    opts.presets.lsp_doc_border = true
  end,
}
