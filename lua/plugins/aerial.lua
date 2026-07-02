-- Override aerial.nvim to fix treesitter backend crash on Neovim 0.12+
-- The treesitter backend in aerial can crash with "attempt to call method 'start' (a nil value)"
-- during async parsing. Prefer the LSP backend (more reliable when available).

---@type LazySpec
return {
  "stevearc/aerial.nvim",
  opts = {
    -- Remove "treesitter" to avoid the crash. LSP is preferred anyway.
    -- Add it back only if you need outline for files without LSP.
    backends = { "lsp", "markdown", "man" },
  },
}
