" vim: fdm=marker

set nocompatible
set lazyredraw
set modelines=1

" use system clipboard
set clipboard=unnamed

" don't open folds on block motions
set foldopen-=block

" enable mouse reporting on all modes
set mouse=a

" reload files changed outside vim
set autoread

" no swap files {{{
" -------------

set nobackup
set nowb
set noswapfile

" }}}
" indentation {{{
" -----------

filetype plugin on
filetype indent on

set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" }}}
" keybindings {{{
" -----------

let mapleader=","

inoremap jj <ESC>

nmap ; :

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" quick window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" fix vertical movements on wrapped lines
nnoremap j gj
nnoremap k gk

" invoke ag
nmap <Leader>g :Ag 

" invoke fzf
nmap <Leader>f :FZF<CR>

" toggle hidden characters
nmap <Leader>hc :set list!<CR>

" toggle line numbers
nmap <Leader>n :set number!<CR>

" reload vimrc
nmap <Leader>rc :so ~/.vimrc<CR>

" install plugins
nmap <Leader>pi :so ~/.vimrc<CR>:PlugInstall<CR>

" }}}
" plugins {{{
" -------

call plug#begin('~/.vim/plugged')

" general
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" completion
if has("nvim")
  Plug 'Shougo/deoplete.nvim'
else
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
endif

" navigation
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'rking/ag.vim'
Plug 'easymotion/vim-easymotion'

" html
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'digitaltoad/vim-jade'

" javascript
Plug 'othree/yajs.vim'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'

" appearance
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'croaker/mustang-vim'
Plug 'w0ng/vim-hybrid'
Plug 'endel/vim-github-colorscheme'
Plug 'mswift42/vim-themes'

call plug#end()

" }}}
" plugin config {{{
" -------------

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

let g:startify_custom_header = []
let g:startify_list_order = [
  \ ['     .:: recent ::.'],
  \ 'files',
  \ ['     .:: cur. directory ::.'],
  \ 'dir',
  \ ['     .:: sessions ::.'],
  \ 'sessions',
  \ ['     .:: bookmarks ::.'],
  \ 'bookmarks',
  \ ]

" }}}
" whitespace {{{
" ----------

set list
set listchars=""
set listchars+=nbsp:·
set listchars+=tab:>·
set listchars+=eol:¬

" }}}
" appearance {{{
" ----------

set number
" set cursorline

" }}}
" colors {{{
" ------

" set t_Co=256
colorscheme gruvbox

" }}}
" gui {{{
" ---

if has("gui_running")
  set guifont=Input\ Mono\ Narrow:h14
  set lsp=4
  set guioptions=
  " set transparency=4
endif

" }}}
" neovim {{{

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" }}}

