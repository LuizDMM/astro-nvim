-- Fix for legacy bundled Neovim rust.vim using deprecated --write-mode flag
-- with modern rustfmt (1.x). Force modern --emit=files behavior.
vim.g.rustfmt_emit_files = 1

return {
  {
    "mrcjkb/rustaceanvim",
    version = vim.fn.has("nvim-0.12") == 1 and "^9" or "^8",
    ft = "rust",
    specs = {
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          handlers = { rust_analyzer = false }, -- disable setup of `rust_analyzer`
        },
      },
    },
    opts = function()
      local astrolsp_opts = vim.lsp.config["rust_analyzer"] or {}

      -- Starting from AstroNvim v6, lsp config entries may contain a
      -- root_dir(bufnr, on_dir) which is incompatible with rustaceanvim's
      -- root_dir(file_name, default_fn) signature. Drop it.
      astrolsp_opts.root_dir = nil

      local server = {
        ---@type table | (fun(project_root:string|nil, default_settings: table|nil):table)
        settings = function(project_root, default_settings)
          local astrolsp_settings = astrolsp_opts.settings or {}
          local merge_table = require("astrocore").extend_tbl(default_settings or {}, astrolsp_settings)

          local ra = require("rustaceanvim.config.server")
          return ra.load_rust_analyzer_settings(project_root, {
            settings_file_pattern = "rust-analyzer.json",
            default_settings = merge_table,
          })
        end,
      }

      local final_server = require("astrocore").extend_tbl(astrolsp_opts, server)
      return { server = final_server }
    end,
    config = function(_, opts)
      vim.g.rustaceanvim = require("astrocore").extend_tbl(opts, vim.g.rustaceanvim)
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "rust-analyzer" })
    end,
  },
}
