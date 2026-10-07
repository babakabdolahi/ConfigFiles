local workspace = "/home/babak/Documents/general-market"

return {
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-golang"] = {
          go_test_args = {
            "-v",
            "-race",
            "-count=1",
            -- "-args",
            -- "-dotenv-dir",
            -- "/home/babak/Documents/general-market/sales/service/",
          },
          dap_mode = "manual",
          dap_manual_config = {
            type = "go",
            name = "Debug Nearest Test (neotest-golang)",
            request = "launch",
            mode = "test",
            args = { "-dotenv-dir", "/home/babak/Documents/general-market/sales/service/" },
          },
        },
      },
    },
  },
  {
    "leoluz/nvim-dap-go",
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Debug Sales Service",
          request = "launch",
          mode = "debug",
          program = workspace .. "/sales/service/cmd/service/main.go",
          cwd = workspace .. "/sales/service",
          args = { "-dotenv-dir", workspace .. "/sales/service" },
        },
        {
          type = "go",
          name = "Debug Sales Webapp",
          request = "launch",
          mode = "debug",
          program = workspace .. "/sales/webapp/cmd/gateway/main.go",
          cwd = workspace .. "/sales/webapp",
          args = { "-dotenv-dir", workspace .. "/sales/webapp" },
        },
      },
    },
  },
}
