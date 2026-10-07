-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- ~/.config/nvim/lua/config/autocmds.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.proto",
  callback = function(args)
    local file = args.file
    local root = vim.fs.root(file, { ".git" }) or vim.fn.getcwd()

    vim.fn.jobstart({
      "protoc",
      "-I",
      root,
      "--go_out",
      root,
      "--go-grpc_out",
      root,
      file,
    }, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stderr = function(_, data)
        if data then
          vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
        end
      end,
    })
  end,
})
