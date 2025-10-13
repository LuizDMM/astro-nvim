return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
          -- C++ compile only
          ["<leader>m"] = {
            function()
              local file = vim.fn.expand('%:p')
              local name = vim.fn.expand('%:t:r')
              local dir = vim.fn.expand('%:p:h')
              if vim.fn.expand('%:e') == 'cpp' or vim.fn.expand('%:e') == 'cc' or vim.fn.expand('%:e') == 'cxx' then
                vim.cmd('split')
                vim.cmd('terminal cd ' .. dir .. ' && clang++ -std=c++20 -o ' .. name .. ' ' .. file)
              else
                vim.notify("Not a C++ file", vim.log.levels.WARN)
              end
            end,
            desc = "Compile C++ file with clang++"
          },
          -- C++ compile and run
          ["<leader>mr"] = {
            function()
              local file = vim.fn.expand('%:p')
              local name = vim.fn.expand('%:t:r')
              local dir = vim.fn.expand('%:p:h')
              if vim.fn.expand('%:e') == 'cpp' or vim.fn.expand('%:e') == 'cc' or vim.fn.expand('%:e') == 'cxx' then
                vim.cmd('split')
                vim.cmd('terminal cd ' .. dir .. ' && clang++ -std=c++20 -o ' .. name .. ' ' .. file .. ' && ./' .. name)
              else
                vim.notify("Not a C++ file", vim.log.levels.WARN)
              end
            end,
            desc = "Compile and run C++ file with clang++"
          }
      }
    }
    }
}
