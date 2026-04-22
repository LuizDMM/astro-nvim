return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon
    if not opts.mappings then opts.mappings = {} end
    if not opts.mappings.n then opts.mappings.n = {} end
    local maps = opts.mappings.n
    maps["<leader>m"] = { desc = get_icon("CompetiTest", 1, true) .. "CompetiTest" }
    maps["<leader>mr"] = { "<cmd>CompetiTest run<cr>", desc = "Run testcases" }
    maps["<leader>ma"] = { "<cmd>CompetiTest add_testcase<cr>", desc = "Add testcase" }
    maps["<leader>me"] = { "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit testcase" }
    maps["<leader>md"] = { "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete testcase" }
    maps["<leader>mp"] = { "<cmd>CompetiTest receive problem<cr>", desc = "Receive problem" }
    maps["<leader>mc"] = { "<cmd>CompetiTest receive contest<cr>", desc = "Receive contest" }
  end,
}
