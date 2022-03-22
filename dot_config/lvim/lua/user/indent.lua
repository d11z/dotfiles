local M = {}

function M.setup()
  require("indent_blankline").setup({
    char = "▏",
    filetype_exclude = {
      "alpha",
      "help",
      "terminal",
      "dashboard",
      "lspinfo",
      "lsp-installer",
    },
    buftype_exclude = { "terminal" },
    bufname_exclude = { "config.lua" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    use_treesitter = false,
  })
end

return M
