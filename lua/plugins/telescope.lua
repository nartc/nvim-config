local Util = require("lazyvim.util")

return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      defaults = {
        preview = {
          hide_on_startup = true,
        },
        layout_config = {
          width = 0.8,
          horizontal = {
            preview_width = 0.9,
          },
        },
        mappings = {
          i = {
            ["<C-a>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
      },
    },
    keys = {
      { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files (root dir)" },
      { "<leader>fF", Util.telescope("files"), desc = "Find Files (cwd)" },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Files (root dir, hidden files, no ignored)",
      },
    },
  },
}
