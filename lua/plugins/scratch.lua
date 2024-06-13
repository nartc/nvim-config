return {
  {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
    dependencies = { "michaelb/sniprun" },
    keys = function()
      return {
        { "<leader>N", "<cmd>Scratch<cr>", desc = "New Scratch file", mode = "n" },
        { "<leader>sN", "<cmd>ScratchOpen<cr>", desc = "Search Scratch files", mode = "n" },
        { "<leader>sNG", "<cmd>ScratchOpenFzf<cr>", desc = "Grep Scratch files", mode = "n" },
      }
    end,
  },
}
