-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "catppuccin"

-- windows clipboard support
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
  ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --crlf",
    ["*"] = "win32yank.exe -o --crlf",
  },
  cache_enable = 0,
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",

  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- require('orgmode').setup_ts_grammar()

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = {
  "<cmd>Telescope projects<CR>",
  "Projects",
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["m"] = {
  name = "+Misc",
  d = { "<cmd>Glow<cr>", "Preview Markdown" },
}

lvim.builtin.which_key.mappings["z"] = {
  "<cmd>Goyo<cr><cmd>Twilight<cr>",
  "+Zen mode",
}

lvim.builtin.which_key.mappings["O"] = {
  "<cmd>SymbolsOutline<CR>",
  "Symbols Outline",
}

vim.api.nvim_set_keymap("n", "<F12>", ":SymbolsOutline<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-x>", ":BufferKill<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<C-_>",
  ":lua require('Comment.api').toggle_current_linewise()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "<C-_>",
  "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
  { noremap = true, silent = true }
)

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "svelte",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "yaml",
  -- "org",

}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 12

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.astro = "tsx"

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    command = "prettier",
    extra_args = { "--print-width", "100" },
  },
  {
    command = "stylua",
    extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
    filetypes = { "lua" },
  },
})

lvim.plugins = {
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function ()
      require("catppuccin").setup({
        styles = {
          comments = "NONE",
          functions = "NONE",
          keywords = "NONE",
          strings = "NONE",
          variables = "NONE",
        },
        integrations = {
          native_lsp = {
            virtual_text = {
              errors = "bold",
              hints = "NONE",
              warnings = "NONE",
              information = "NONE",
            },
          },
        },
      })
    end,
  },
  { "folke/lsp-colors.nvim", event = "BufRead" },
  { "folke/trouble.nvim" },
  -- { "chrisbra/unicode.vim" },
  -- stabilize buffer content on window open/close events
  {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  -- {
  --   "nacro90/numb.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("numb").setup({
  --       show_numbers = true, -- Enable 'number' for the window while peeking
  --       show_cursorline = true, -- Enable 'cursorline' for the window while peeking
  --     })
  --   end,
  -- },
  {
    "phaazon/hop.nvim",

    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  { "ggandor/lightspeed.nvim", event = "BufRead" },
  -- { "metakirby5/codi.vim", cmd = "Codi" },
  { "tpope/vim-surround", keys = { "c", "d", "y" } },
  -- { "npxbr/glow.nvim", ft = { "markdown" } },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    module = "persistence",
    config = function()
      require("persistence").setup({

        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),

        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },
  -- vim sugar for unix helpers e.g. :SudoWrite
  { "tpope/vim-eunuch" },
  -- nvim-colorizer
  -- color highlighter #ff0000, Blue, #f0f
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        names = true, -- "Name" codes, see https://www.w3schools.com/colors/colors_hex.asp   Blue, HotPink, OldLace, Plum, LightGreen, Coral
        RGB = true, -- #RGB hex codes                                                      #f0f #FAB
        RRGGBB = true, -- #RRGGBB hex codes                                                   #ffff00 #FF00FF
        RRGGBBAA = true, -- #RRGGBBAA hex codes                                                 #ffff00ff #AbCdEf
        rgb_fn = true, -- CSS rgb() and rgba() functions                                      rgb(100,200,50) rgba(255,255,255,1.0) rgb(100%, 0%, 0%)
        hsl_fn = true, -- CSS hsl() and hsla() functions                                      hsl(120,100%,50%) hsla(20,100%,40%,0.7)
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Set the display mode.
      })
    end,
  },
  -- indent-blankline
  -- indentation guides for every line
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end,
  },

  -- {'nvim-orgmode/orgmode', config = function()
  --       require('orgmode').setup{}
  -- end
  -- },
  -- press 'ga' to see details about character under cursor
  { "tpope/vim-characterize" },

  -- make some tui elements look better
  { "stevearc/dressing.nvim" },

  -- distraction-free writing
  { "junegunn/goyo.vim" },
  { "folke/twilight.nvim" },
}

lvim.builtin.dashboard.custom_header = {
  "                                                       ",
  "                                                       ",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}


lvim.builtin.dashboard.footer = { "Δ Ξ" }

vim.cmd([[
let g:netrw_http_cmd = 'curl --ssl-no-revoke -Lo'

let bufferline = get(g:, 'bufferline', {})
let bufferline.icons="both"
let bufferline.icon_close_tab_modified=''
let bufferline.icon_custom_colors="false"

" Disable some things on the dashboard.
autocmd! Filetype * if &ft=="dashboard"| highlight longLine NONE |endif | autocmd WinLeave <buffer> highlight longLine guibg=#5F3F3F
autocmd! Filetype * if &ft=="dashboard"| highlight extraWhitespace NONE |endif | autocmd WinLeave <buffer> highlight extraWhitespace guibg=Red

" Setup folding
" set foldenable             " Folding enabled
" set foldmethod=marker      " Folding method, based on { { {1
" set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" set fillchars=stl:\ ,foldclose:,foldopen:,foldsep:┃,fold:\ ,eob:~,msgsep:‾,vert:\│

set guifont=PragmataPro\ Mono:h16,JetBrainsMono\ NF:h16

set showbreak=↪\
" ¬
set listchars=tab:→\ ,eol:↲,trail:~,nbsp:␣,extends:⟩,precedes:⟨,space:·
set list
]])

local cp = require'catppuccin.api.colors'.get_colors()
require("catppuccin").remap({
  ErrorMsg = { fg = cp.red, style = "bold" },
  TSProperty = { fg = cp.yellow, style = "NONE" },
	TSInclude = { fg = cp.teal, style = "NONE" },
	TSOperator = { fg = cp.sky, style = "bold" },
	TSKeywordOperator = { fg = cp.sky, style = "bold" },
	TSPunctSpecial = { fg = cp.maroon, style = "bold" },
	TSFloat = { fg = cp.peach, style = "bold" },
	TSNumber = { fg = cp.peach, style = "bold" },
	TSBoolean = { fg = cp.peach, style = "bold" },
	TSConditional = { fg = cp.mauve, style = "bold" },
	TSRepeat = { fg = cp.mauve, style = "bold" },
	TSException = { fg = cp.peach, style = "NONE" },
	TSConstBuiltin = { fg = cp.lavender, style = "NONE" },
	TSFuncBuiltin = { fg = cp.peach, style = "NONE" },
	TSTypeBuiltin = { fg = cp.yellow, style = "NONE" },
	TSVariableBuiltin = { fg = cp.teal, style = "NONE" },
	TSFunction = { fg = cp.blue, style = "NONE" },
	TSParameter = { fg = cp.rosewater, style = "NONE" },
	TSKeywordFunction = { fg = cp.maroon, style = "NONE" },
	TSKeyword = { fg = cp.red, style = "NONE" },
	TSMethod = { fg = cp.blue, style = "NONE" },
	TSNamespace = { fg = cp.rosewater, style = "NONE" },
	TSStringRegex = { fg = cp.peach, style = "NONE" },
	TSVariable = { fg = cp.white, style = "NONE" },
	TSTagAttribute = { fg = cp.mauve, style = "NONE" },
	TSURI = { fg = cp.rosewater, style = "underline" },
	TSLiteral = { fg = cp.teal, style = "NONE" },
	TSEmphasis = { fg = cp.maroon, style = "NONE" },
	TSStringEscape = { fg = cp.pink, style = "NONE" },
	bashTSFuncBuiltin = { fg = cp.red, style = "NONE" },
	bashTSParameter = { fg = cp.yellow, style = "NONE" },
	typescriptTSProperty = { fg = cp.lavender, style = "NONE" },
	cssTSProperty = { fg = cp.yellow, style = "NONE" },
})

