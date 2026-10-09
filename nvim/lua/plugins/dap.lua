return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
    },
    keys = {
      { "<F5>", function() require("dap").continue() end },
      { "<F10>", function() require("dap").step_over() end },
      { "<F11>", function() require("dap").step_into() end },
      { "<F12>", function() require("dap").step_out() end },
      { "<leader>db", function() require("dap").toggle_breakpoint() end },
      { "<leader>du", function() require("dapui").toggle() end },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui"] = dapui.open
      dap.listeners.before.event_terminated["dapui"] = dapui.close
      dap.listeners.before.event_exited["dapui"] = dapui.close

      -- Go (needs `delve`)
      require("dap-go").setup()

      -- Rust (needs `:MasonInstall codelldb`)
      local codelldb = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = { command = codelldb, args = { "--port", "${port}" } },
      }
      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("exe: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },
}
