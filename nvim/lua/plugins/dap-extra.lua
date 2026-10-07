return {
  "mfussenegger/nvim-dap",
  -- stylua: ignore
  keys = {
    { "<leader>dX", function() require("dap").clear_breakpoints() end, desc = "Clear All Breakpoints" },
    { "<leader>dL", function() require("dap").list_breakpoints(true) end, desc = "List Breakpoints (quickfix)" },
  },
}
