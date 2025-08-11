call plug#begin()

Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'code-biscuits/nvim-biscuits'

call plug#end()

set background=dark
colorscheme gruvbox

set number " enable line numbers

set hlsearch " highlight matching patterns of a search
set cursorline " highlight current line

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Show matching brackets when text indicator is over them
set showmatch

" Use OS clipboard
set clipboard=unnamedplus

" pls just accept that I want to exit vim.
command! Q	q
command! W	w
command! Wq	wq
command! WQ	wq


" CTRL-c / CTRL-V
vmap <C-c> y
imap <C-v> <esc>pi
nmap <C-v> p

" CTRL-f = Search
nmap <C-f> /
imap <C-f> <esc>/

" CTRL-z = Undo
nmap <C-z> u
imap <C-z> <esc>ui

" CTRL-y = Redo
nmap <C-y> <C-r>
imap <C-y> <esc><C-r>i
imap <C-r> <esc><C-r>i
nmap r <C-r>

" Use Shift-Up/Down/Left/Right to select text.
imap <S-Down> <esc>v<Down>
nmap <S-Down> v<Down>
vmap <S-Down> <Down>

imap <S-Up> <esc>v<Up>
nmap <S-Up> v<Up>
vmap <S-Up> <Up>

imap <S-Left> <esc>v<Left>
nmap <S-Left> v<Left>
vmap <S-Left> <Left>

imap <S-Right> <esc>v<Right>
nmap <S-Right> v<Right>
vmap <S-Right> <Right>