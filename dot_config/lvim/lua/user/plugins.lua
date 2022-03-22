return {
  -- treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufRead",
    config = function ()
      require("user.textobjects").setup()
    end
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
    config = function ()
      lvim.builtin.treesitter.playground.enable = true
    end,
  },

  -- better in-line diagnostics
  {
  "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  { "felipec/vim-sanegx" },

  {
    "michaelb/sniprun",
    run = "bash ./install.sh",
    config = function()
      require("user.sniprun").setup()
    end,
    event = "BufReadPost",
  },

  -- auto close and rename markup tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- better quickfix
  {
    "kevinhwang91/nvim-bqf",
    event = "BufReadPost",
    config = function ()
      require("bqf").setup {
        auto_enable = true,
      }
    end,
  },

  -- sessions
  { "rmagatti/auto-session",
    config = function ()
      require "auto-session".setup {
        auto_session_enable_last_session = false,
      }
    end,
  },

  -- hide line numbers unless you need them
  { "nacro90/numb.nvim" },

  -- color scheme
  {
    "rebelot/kanagawa.nvim",
    config = function ()
      require("kanagawa").setup {
        commentStyle = "NONE",
        keywordStyle = "NONE",
        variablebuiltinStyle = "NONE",
        dimInactive = true,
        globalStatus = true,
      }
    end,
  },

  -- dims unimportant text
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup()
    end,
  },

  -- jump around
  {
    "ggandor/lightspeed.nvim",
    event = "BufReadPost",
    config = function ()
      require("user.lightspeed").setup()
    end,
  },

  {
    "arkav/lualine-lsp-progress",
    opt = false,
    disable = false,
  },

  { "tpope/vim-surround", keys = { "c", "d", "y" } },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    config = function()
      require("user.indent").setup()
    end,
  },

  -- press 'ga' to see details about character under cursor
  { "tpope/vim-characterize" },


  -- nvim-colorizer
  -- color highlighter #ff0000, Blue, #f0f
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Set the display mode.
      })
    end,
  },
}

