local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "bash", "lua", "json", "javascript", "yaml", "css", "typescript" },

    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
    rainbow = { enable = false },

    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",

          ["ar"] = "@parameter.inner", -- "ap" is already used

          ["ir"] = "@parameter.outer", -- "ip" is already used
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-big",
        },
      },
    },
  }
end

return M

