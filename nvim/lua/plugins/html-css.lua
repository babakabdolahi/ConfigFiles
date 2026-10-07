-- lua/plugins/html-css.lua
--
-- LazyVim has no "lang.html" or "lang.css" extra (confirmed against the
-- actual extras list at lazyvim.org/extras -- lang covers ~40 languages,
-- but not these two). So unlike Go, this has to be wired up by hand --
-- same idea as your old init.lua's vim.lsp.config/vim.lsp.enable calls,
-- just shorter, since LazyVim's core already provides:
--   - the LspAttach autocmd + all the gd/gr/K/<leader>ca etc. keymaps
--   - the capabilities table (blink.cmp's LSP capabilities instead of
--     cmp-nvim-lsp's, but same idea)
-- so this file only needs to REGISTER the servers, not re-implement
-- everything your old config did around them.

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- LazyVim merges these into its own server list and handles
      -- calling vim.lsp.config/vim.lsp.enable + Mason installation for
      -- you -- you just declare which servers you want.
      servers = {
        html = {},
        cssls = {},
      },
    },
  },

  -- Mason needs to know to install the two servers' binaries. LazyVim's
  -- mason.nvim spec reads `opts.ensure_installed` the same way your old
  -- mason-lspconfig block did.
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "html-lsp", "css-lsp" })
    end,
  },
}
