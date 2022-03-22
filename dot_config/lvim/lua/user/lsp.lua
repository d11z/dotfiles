
lvim.lsp.null_ls.setup = {
  log = {
    level = "warn",
  },
}

vim.lsp.set_log_level("warn")
require("vim.lsp.log").set_format_func(vim.inspect)

require("nvim-lsp-installer").settings {
  log_level = vim.log.levels.WARN,
}

lvim.lsp.on_attach_callback = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  -- enable completion triggered by <C-x><C-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end
