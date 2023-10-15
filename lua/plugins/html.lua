return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        html = function(_, opts)
          opts.init_options = {
            dataPaths = {
              vim.fn.getcwd() .. "/libs/angular-three/metadata.json",
              vim.fn.getcwd() .. "/libs/angular-three-soba/metadata.json",
              vim.fn.getcwd() .. "/node_modules/angular-three/metadata.json",
              vim.fn.getcwd() .. "/node_modules/angular-three-soba/metadata.json",
            },
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
              css = true,
              javascript = true,
            },
            provideFormatter = true,
          }

          opts.handlers = {
            ["html/customDataContent"] = function(err, result, ctx, config)
              local function exists(name)
                if type(name) ~= "string" then
                  return false
                end
                return os.execute("test -e " .. name)
              end

              if not vim.tbl_isempty(result) and #result == 1 then
                if not exists(result[1]) then
                  return ""
                end

                print(result[1])
                local stat = vim.loop.fs_stat(result[1])
                if stat ~= nil then
                  local content = vim.fn.join(vim.fn.readfile(result[1]), "\n")
                  return content
                else
                  return ""
                end
              end
              return ""
            end,
          }

          return false
        end,
      },
    },
  },
}
