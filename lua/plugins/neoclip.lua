return {
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end,
    keys = {
      {
        "<leader>sM",
        "<cmd>Telescope neoclip<cr>",
        silent = true,
        noremap = true,
        desc = "Clipboard History",
      },
    },
  },
}
