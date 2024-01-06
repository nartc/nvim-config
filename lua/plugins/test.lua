return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      },
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestConfigFile = function(path)
            local util = require("neotest-vitest.util")
            local vite_config_path = util.search_ancestors(path, function(ancestor_path)
              return util.path.exists(ancestor_path .. "/jest.config.ts")
            end)

            local vite_config_file = vite_config_path .. "/jest.config.ts"

            if util.path.exists(vite_config_file) then
              return vite_config_file
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(
        opts.adapters,
        require("neotest-vitest")({
          vitestConfigFile = function(path)
            local util = require("neotest-vitest.util")
            local vite_config_path = util.search_ancestors(path, function(ancestor_path)
              return util.path.exists(ancestor_path .. "/vite.config.ts")
            end)

            local vite_config_file = vite_config_path .. "/vite.config.ts"

            if util.path.exists(vite_config_file) then
              return vite_config_file
            end

            return vim.fn.getcwd() .. "/vite.config.ts"
          end,
        })
      )
    end,
  },
}
