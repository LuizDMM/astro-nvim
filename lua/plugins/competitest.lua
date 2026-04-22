return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require("competitest").setup({
        compile_command = {
          cpp = { exec = "clang++", args = { "-std=c++20", "-O2", "-Wall", "-Wextra", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },
        run_command = {
          cpp = { exec = "./$(FNOEXT)" },
        },

        testcases_directory = ".",
        testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
        testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",

        companion_port = 27121,
        received_files_extension = "cpp",
        received_problems_path = "$(CWD)/$(PROBLEM).$(FEXT)",
        received_problems_prompt_path = true,
        received_contests_directory = "$(CWD)",
        received_contests_problems_path = "$(PROBLEM)/main.$(FEXT)",
        received_contests_prompt_directory = true,
        received_contests_prompt_extension = true,
        open_received_problems = true,
        open_received_contests = true,
      })
    end,
  },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      icons = {
        CompetiTest = "󰙨",
      },
      text_icons = {
        CompetiTest = "[CT]",
      },
    },
  },
}
