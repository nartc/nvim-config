return {
  { "sainnhe/gruvbox-material" },
  { "Shatur/neovim-ayu" },
  { "rebelot/kanagawa.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "bluz71/vim-moonfly-colors" },
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 2000,
      set_dark_mode = function()
        vim.go.background = "dark"
        -- vim.cmd("colorscheme ayu-mirage")
        vim.cmd("colorscheme moonfly")
      end,
      set_light_mode = function()
        vim.go.background = "light"
        vim.cmd("colorscheme vscode")
      end,
    },
  },
}
