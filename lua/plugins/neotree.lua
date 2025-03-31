return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            --auto close
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_current",
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        window = {
          position = "current",
        },
      },
    },
    keys = function()
      return {
        {
          "<leader>e",
          function()
            require("neo-tree.command").execute({ toggle = true, reveal = true, dir = vim.loop.cwd() })
          end,
          desc = "Explorer NeoTree",
        },
        {
          "<leader>ge",
          function()
            require("neo-tree.command").execute({ source = "git_status", toggle = true })
          end,
          desc = "Explorer Git in NeoTree",
        },
      }
    end,
  },
}
