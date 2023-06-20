return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            --auto close
            require("neo-tree").close_all()
          end,
        },
      },
    },
    keys = function()
      return {
        {
          "<leader>E",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
          end,
          desc = "Explorer NeoTree (root dir)",
        },
        {
          "<leader>e",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
          end,
          desc = "Explorer NeoTree (cwd)",
        },
      }
    end,
  },
}
