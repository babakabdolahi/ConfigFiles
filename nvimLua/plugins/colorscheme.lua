-- lua/plugins/colorscheme.lua
--
-- LazyVim loads every file under lua/plugins/ automatically -- no manual
-- `require` needed, unlike your old hand-rolled init.lua. Each file just
-- returns a list of plugin specs (or a single spec) and LazyVim merges them
-- all together at startup.
--
-- Colorschemes in LazyVim work a bit differently from a plain Neovim setup:
--   1. You still add the colorscheme plugin itself (like before).
--   2. But instead of manually calling `vim.cmd.colorscheme(...)` yourself,
--      you tell the CORE "LazyVim" plugin which one to activate by default
--      via its `opts.colorscheme` field. LazyVim then applies it at the
--      right point in startup (after all plugins are loaded, avoiding the
--      "flash of wrong colors" issue your old config could hit).
--   3. Any colorscheme plugin you install becomes available in LazyVim's
--      built-in picker (<leader>uC) even if it isn't the default -- so
--      adding both here means you can live-preview and switch between them
--      any time, not just the one marked default below.

return {

  -- vscode.nvim: a port of VS Code's actual "Dark Modern" color values,
  -- with Treesitter + LSP semantic-token support so highlighting matches
  -- what you'd see in the VS Code editor itself.
  {
    "Mofiqul/vscode.nvim",
    lazy = true, -- LazyVim loads colorscheme plugins on demand, not eagerly;
    -- `priority = 1000` isn't needed here like in your old
    -- config, since LazyVim's own startup sequencing handles load order.
    opts = {
      style = "dark", -- VS Code's current default theme
      transparent = false,
      italic_comments = true,
    },
  },

  -- gruvbox.nvim: warm, retro, low-contrast palette. Popular default choice
  -- for long terminal sessions.
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      terminal_colors = true,
      contrast = "soft", -- "hard" | "soft" | "" (empty = default contrast)
    },
  },

  -- This is the one line that actually decides what loads on startup.
  -- Change "gruvbox" to "vscode" here to flip the default any time --
  -- or just use <leader>uC in Neovim to preview + switch interactively
  -- without editing this file at all.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
