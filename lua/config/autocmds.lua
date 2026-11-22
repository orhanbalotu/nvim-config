-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Terminal olan windowa girince direkt terminal moduna gecme
--vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "TermOpen" }, {
--  group = vim.api.nvim_create_augroup("TerminalAutoInsert", { clear = true }),
--  callback = function()
--    if vim.bo.buftype == "terminal" then
--      vim.cmd("startinsert")
--    end
--  end,
--})
-- Markdown diagnostic kapat
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("DisableMarkdownDiagnostics", { clear = true }),
  pattern = { "markdown", "markdown.mdx" },
  callback = function(event)
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
})

