return {
  {
    "mrcjkb/rustaceanvim", -- add lsp plugin
    version = "^5",
    lazy = false, -- This plugin is already lazy
    opts = function(_, opts)
      local server_opts = vim.lsp.config.rust_analyzer
      local server = {
        ---@type table | (fun(project_root:string|nil, default_settings: table|nil):table) -- The rust-analyzer settings or a function that creates them.
        settings = function(project_root, default_settings)
          local merge_table = require("astrocore").extend_tbl(default_settings or {}, server_opts.settings or {})
          local ra = require "rustaceanvim.config.server"
          -- load_rust_analyzer_settings merges any found settings with the passed in default settings table and then returns that table
          return ra.load_rust_analyzer_settings(project_root, {
            settings_file_pattern = "rust-analyzer.json",
            default_settings = merge_table,
          })
        end,
      }
      return { server = require("astrocore").extend_tbl(server_opts, server) }
    end,
    -- configure `rustaceanvim` by setting the `vim.g.rustaceanvim` variable
    config = function(_, opts) vim.g.rustaceanvim = require("astrocore").extend_tbl(opts, vim.g.rustaceanvim) end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      handlers = { rust_analyzer = false }, -- Let rustaceanvim setup `rust_analyzer`
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "rust-analyzer" }, -- automatically install lsp
    },
  },
}
