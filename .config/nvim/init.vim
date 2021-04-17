" =========================================================
"
"   ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"   ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"   ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"   ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"
" neovim configuration file
"
" Version: 0.8.4 - 2021/04/17
" Maintainer: Brainfuck
" Website: https://github.com/brainfucksec/dotfiles
"
" =========================================================


" =========================================================
" General settings
" =========================================================

" change leader to a comma because the backslash is too far away
" that means all \x commands turn into ,x
" the mapleader has to be set before plugin manager starts loading all
" the plugins.
let mapleader = ","

" enable mouse support
set mouse=a

" copy all yanking/pasting operations to the system clipboard
set clipboard+=unnamedplus

" use Unix for new files and autodetect the rest
set ffs=unix,dos,mac

" turn backup off, swap file off
set nobackup
set noswapfile


" =========================================================
" Neovim UI
" =========================================================

" enable syntax highlighting
syntax enable

" add a bit extra margin to the left
"set foldcolumn=1

" show line number
set number

" highlight current line
"set cursorline

" highlight matching parenthesis
set showmatch

" enable folding manually with 'marker' option
" use default 'foldmarker' (three consecutive open/closed curly braces)
set foldmethod=marker

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" line lenght marker at 80 columns
set colorcolumn=80

" open vertical split to the right
set splitright

" open horizontal split to the bottom
set splitbelow

" search settings (case insensitive, highlights)
set incsearch ignorecase smartcase hlsearch


" =========================================================
" Colors and fonts
" =========================================================

" terminal options
set t_Co=256
set termguicolors

" set transparent background
"au ColorScheme * hi Normal ctermbg=none guibg=none
"au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" colorscheme
let g:rehash256 = 1
colorscheme molokai


" =========================================================
" Memory, CPU
" =========================================================

" this makes neovim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" sets how many lines of history neovim has to remember
set history=100

" faster scrolling
set ttyfast
set lazyredraw

" syntax highlight only for N colums
set synmaxcol=240


" =========================================================
" Text, tabs, indent
" =========================================================

" use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" remove line lenght marker for selected filetypes
autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal colorcolumn=0

" 2 spaces for selected filetypes
autocmd FileType xml,html,xhtml,css,scss,javascript setlocal shiftwidth=2 tabstop=2

" 8 spaces for `go` filetypes
autocmd FileType go setlocal shiftwidth=8 tabstop=8

set smartindent "Smart indent
set wrap        "Wrap lines

" stop annying auto commenting on new lines
au BufEnter * set fo-=c fo-=r fo-=o

" indentLine
"
" indent lines style
let g:indentLine_char = '│'
"let g:indentLine_setColors = 0


" =========================================================
" Autocompletion, linting
" =========================================================

" avoids scanning of 'tags (t)' and 'included files (i)' during completion
set complete-=t,i

" completion popup settings (:help 'completeopt')
set completeopt+=menuone,noselect,noinsert

" shut off completion messages
set shortmess+=c

" workaround for auto-pairs issue
let g:AutoPairsMapCR = 0

" MUcomplete
let g:mucomplete#enable_auto_at_startup = 1

" endwise compatibility
imap <Plug>MyCR <Plug>(MUcompleteCR)

" ALE (Linter)
let g:ale_enabled = 1

" run linter only after save the file
let g:ale_lint_on_text_changed = 'never'

" don't run linter after open a file
let g:ale_lint_on_enter = 0

" navigate between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Omnicompletion languages plugins
"
" C/C++ -> clang-complete
" path to directory where library can be found
let g:clang_library_path = '/usr/lib'
let g:clang_complete_auto = 1

" Python -> jedi-vim
" use tabs when going to a definition
let g:jedi#use_tabs_not_buffers = 1

" disable docstring window to popup during completion
autocmd FileType python setlocal completeopt-=preview

" JavaScript -> vim-javascript
let g:javascript_plugin_flow = 1

" HTML/CSS -> vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


" =========================================================
" Status line (lightline)
" =========================================================

" disable mode information under status line
set noshowmode

" settings
let g:lightline = {
    \ 'colorscheme': 'molokai',
    \ 'component_function': {
    \     'filetype': 'MyFiletype',
    \     'fileformat': 'MyFileformat',
    \ }
    \ }


" =========================================================
" Keymapping
" =========================================================

" reload neovim config with Ctrl+r without restart
map \r :source ~/.config/nvim/init.vim<CR>

" clear search highlighting
nnoremap <silent> <leader>c :nohl<CR>

" press kk to exit.
inoremap kk <Esc>

" don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" fast saving
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" move around splits using Ctrl + {h,j,k,l}
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NerdTree
"open NERDTree automatically when neovim starts up
"autocmd vimenter * NERDTree

" open/close NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" tagbar
" open/close tagbar with Ctrl+m
nmap <C-m> :TagbarToggle<CR>

