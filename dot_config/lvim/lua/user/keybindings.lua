lvim.leader = "space"

lvim.keys = {
  insert_mode = {
    -- quit insert mode
    ["jk"] = "<ESC>",
    ["kj"] = "<ESC>",
    ["jj"] = "<ESC>",

    -- save file and quit insert-mode
    ["<C-s>"] = "<ESC>:w<CR>",

    -- move the cursor
    ["<A-h>"] = "<Left>",
    ["<A-l>"] = "<Right>",
  },

    normal_mode = {
    -- Tab switch buffer
    ["<S-l>"] = ":BufferLineCycleNext<CR>",
    ["<S-h>"] = ":BufferLineCyclePrev<CR>",

    -- save file
    ["<C-s>"] = ":w<CR>",

    -- no one cares about ex mode
    ["<S-q>"] = ":BufferKill<CR>",
    ["<S-x>"] = ":BufferKill<CR>",
  },

  visual_mode = {
    -- better indent
    ["<"] = "<gv",
    [">"] = ">gv",
  },

  command_mode = {
    -- navigate tab completion with <c-j> and <c-k>, runs conditionally
    ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
    ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
  },
}

-- vim.api.nvim_set_keymap(
--   "n",
--   "<C-_>",
--   "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "v",
--   "<C-_>",
--   "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
--   { noremap = true, silent = true }
-- )

