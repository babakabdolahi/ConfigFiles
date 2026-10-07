return {
  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "gherkin" })
    end,
  },

  -- for this to work one has to install the python lib reformat-gherkin
  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cucumber = { "reformat-gherkin" },
      },
      formatters = {
        ["reformat-gherkin"] = {
          command = "reformat-gherkin",
          args = { "-" },
          stdin = true,
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters = opts.formatters or {}

      opts.formatters_by_ft.cucumber = { "reformat-gherkin" }

      opts.formatters["reformat-gherkin"] = {
        command = "reformat-gherkin",
        args = { "--tab-width", "4", "-" },
        stdin = true,
      }
    end,
  },
}
