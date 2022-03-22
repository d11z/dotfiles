local M = {}

function M.setup()
  require("lightspeed").setup {
    ignore_case = false,
    exit_after_idle_msecs = {
      unlabeled = 1000,
      labeled = 1500,
    },

    -- jump right after the first input if only one found
    jump_to_unique_chars = {
      safety_timeout = 400,
    },

    match_only_the_start_of_same_char_seqs = true,

    substitute_chars = { ["\r"] = "¬" },

    special_keys = {
      next_match_group = "<space>",
      prev_match_group = "<tab>",
    },

    limit_ft_matches = 4,

    repeat_ft_with_target_char = false,
  }
end

return M

