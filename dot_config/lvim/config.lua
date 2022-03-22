lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "kanagawa"

lvim.builtin.alpha.active = true
lvim.builtin.notify.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- hot reload
for module, _ in pairs(package.loaded) do
  if module:match "user" then
    _G.require_clean(module)
  end
end

require "user.settings"
require "user.keybindings"
require "user.dashboard"
require "user.lsp"
require "user.statusline"
require "user.telescope"

lvim.plugins = require "user.plugins"

