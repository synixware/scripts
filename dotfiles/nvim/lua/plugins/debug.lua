return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "julianolf/nvim-dap-lldb",
  },
  keys = function(_, keys)
    local dap = require("dap")
    local dapui = require("dapui")
    return {
      { "<F5>", dap.continue, desc = "Debug: Start/Continue" },
      { "<F6>", dap.close, desc = "Debug: Close" },
      { "<F1>", dap.step_into, desc = "Debug: Step Into" },
      { "<F2>", dap.step_over, desc = "Debug: Step Over" },
      { "<F3>", dap.step_out, desc = "Debug: Step Out" },
      { "<leader>bb", dap.toggle_breakpoint, desc = "Debug: Toggle Breakpoint" },
      {
        "<leader>bB",
        function()
          dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Debug: Set Breakpoint",
      },
      { "<F7>", dapui.toggle, desc = "Debug: See last session result." },
      unpack(keys),
    }
  end,
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        "python",
        "codelldb",
        -- "cppdbg", -- cpptools
      },
    })

    -- https://github.com/mfussenegger/nvim-dap/discussions/1407#discussioncomment-11705594
    dap.configurations.go = {
      {
        type = "delve",
        name = "file",
        request = "launch",
        program = "${file}",
        outputMode = "remote",
      },
    }

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    dapui.setup()

    vim.api.nvim_set_hl(0, "DapUIPlayPauseNC", { link = "WinBar" })
    vim.api.nvim_set_hl(0, "DapUIRestartNC", { link = "WinBar" })
    vim.api.nvim_set_hl(0, "DapUIStopNC", { link = "WinBar" })
    vim.api.nvim_set_hl(0, "DapUIUnavailableNC", { link = "WinBar" })
    vim.api.nvim_set_hl(0, "DapUIStepOverNC", { link = "WinBar" })
    vim.api.nvim_set_hl(0, "DapUIStepIntoNC", { link = "WinBar" })
    vim.api.nvim_set_hl(0, "DapUIStepBackNC", { link = "WinBar" })
    vim.api.nvim_set_hl(0, "DapUIStepOutNC", { link = "WinBar" })

    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#ff869a", bg = "#212432" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#82b1ff", bg = "#212432" })
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#c3e88d", bg = "#212432" })

    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapLogPoint",
      { text = "󰛿", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
    )
    vim.fn.sign_define(
      "DapStopped",
      { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
    )
  end,
}
