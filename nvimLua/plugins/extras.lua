-- lua/plugins/extras.lua
--
-- LazyVim "extras" are pre-written, maintained config bundles for a given
-- language/feature -- this is the alternative to hand-writing gopls setup,
-- Mason ensure_installed lists, formatter wiring, etc. yourself (which is
-- what your old init.lua did manually, and what broke when APIs changed).
--
-- You enable an extra by importing its module path as a plugin spec. This
-- is equivalent to toggling it on via the :LazyExtras UI picker -- same
-- effect, just written down explicitly here so it's version-controlled and
-- reproducible instead of a one-off interactive choice.
--
-- What lazyvim.plugins.extras.lang.go actually gives you, out of the box:
--   - gopls registered + enabled (via vim.lsp.config/enable under the hood,
--     same mechanism your old config used by hand)
--   - goimports + gofumpt installed via Mason, wired into format-on-save
--   - staticcheck-style diagnostics
--   - Treesitter parsers for go/gomod/gosum/gowork ensured installed
--   - nvim-dap-go is included too, so debugging via <leader>d... keymaps
--     (breakpoints, step over/into/out, nearest-test debug) works right
--     away without a separate dap.go extra

return {
  { import = "lazyvim.plugins.extras.lang.go" },

  -- NOTE: there is no "lang.html" extra -- LazyVim's `lang` category covers
  -- ~40 languages (Go, Rust, Vue, Astro, etc.) but HTML/CSS aren't among
  -- them. The html/cssls LSP servers have to be registered by hand (see
  -- lua/plugins/html-css.lua below) -- this is the one gap LazyVim doesn't
  -- paper over for you.
  --
  -- formatting.prettier IS a real extra though: it installs Prettier via
  -- Mason and wires it into conform.nvim for every filetype Prettier
  -- supports (html, css, scss, json, markdown, yaml, graphql, etc.) --
  -- this is what actually fixes format-on-save for HTML/CSS.
  { import = "lazyvim.plugins.extras.formatting.prettier" },
}
