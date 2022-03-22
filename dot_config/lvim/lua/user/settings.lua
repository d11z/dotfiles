vim.cmd "set syntax=off"

vim.opt.laststatus = 3
vim.opt.showbreak = "↪" -- alt: ¬
vim.opt.list = true
vim.opt.listchars = "tab:→\\ ,eol:↲,trail:~,nbsp:␣,extends:⟩,precedes:⟨,space:·"
vim.opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- used in searching and recognizing with many commands
vim.opt.iskeyword:append "-"
-- let movement keys reach the previous line
vim.opt.whichwrap:append "<,>,[,],h,l"
-- remove folding characters
vim.opt.fillchars = { fold = " " }

-- if vim.fn.has "wsl" == 1 then
--   vim.g.clipboard = {
--     name = "win32yank-wsl",
--     copy = {
--       ["+"] = "win32yank.exe -i --crlf",
--       ["*"] = "win32yank.exe -i --crlf",
--     },
--     paste = {
--       ["+"] = "win32yank.exe -o --crlf",
--       ["*"] = "win32yank.exe -o --crlf",
--     },
--     cache_enable = 0,
--   }
-- end

