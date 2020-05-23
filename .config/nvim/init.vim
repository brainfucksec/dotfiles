" =========================================================
"
" ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
" ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
" ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
" ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
" ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
" ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
"
"
" neovim configuration file
"
" Version: 0.6.0 - 2020/05/23
" Maintainer: Brainfuck
" Website: https://github.com/brainfucksec/dotfiles
" =========================================================


" =========================================================
" General
" =========================================================

" Enable filetype detection
filetype on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before plugin manager starts loading all
" the plugins.
let mapleader = ","


" =========================================================
" nvim UI
" =========================================================

" Turn on syntax highlighting
syntax on

" Add a bit extra margin to the left
"set foldcolumn=1

" Show line number
set number

" Highlight current line
"set cursorline

" Highlight matching parenthesis
set showmatch

" Enable folding manually with 'marker' option
" Use default 'foldmarker' (three consecutive open/closed curly braces)
set foldmethod=marker

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Line lenght marker at 80 columns
set colorcolumn=80

" Open vertical split to the right
set splitright

" Open horizontal split to the bottom
set splitbelow


" =========================================================
" Colors and fonts
" =========================================================

" Terminal options
set t_Co=256
set termguicolors

" Set transparent background
"au ColorScheme * hi Normal ctermbg=none guibg=none
"au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" Colorscheme
let g:rehash256 = 1
colorscheme molokai


" =========================================================
" Files, backups
" =========================================================

" Use Unix for new files and autodetect the rest
set ffs=unix,dos,mac

" Turn backup off, swap file off
set nobackup
set noswapfile

" Remove line lenght marker for selected filetypes
autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal colorcolumn=0


" =========================================================
" Memory, CPU
" =========================================================

" This makes neovim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Sets how many lines of history neovim has to remember
set history=100

" Faster scrolling
set ttyfast
set lazyredraw

" Syntax highlight only for N colums
set synmaxcol=240


" =========================================================
" Text, tabs, indent
" =========================================================

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" 2 spaces for selected filetypes
autocmd FileType xml,html,xhtml,css,javascript setlocal shiftwidth=2 tabstop=2

" 8 spaces for `go` filetypes
autocmd FileType go setlocal shiftwidth=8 tabstop=8

set si "Smart indent
set wrap "Wrap lines

" Stop annying auto commenting on new lines
au BufEnter * set fo-=c fo-=r fo-=o

" indentLine
" ==========
"
" indent lines style
let g:indentLine_char = '│'
"let g:indentLine_setColors = 0


" =========================================================
" Autocompletion, linting
" =========================================================

" Avoids scanning of 'tags (t)' and 'included files (i)' during completion
set complete-=t,i

" Completion popup settings (:help 'completeopt')
set completeopt+=menuone,noselect,noinsert

" Shut off completion messages
set shortmess+=c

" Workaround for auto-pairs issue
let g:AutoPairsMapCR = 0


" MUcomplete
" ==========
let g:mucomplete#enable_auto_at_startup = 1

" endwise compatibility
imap <Plug>MyCR <Plug>(MUcompleteCR)


" ALE (Linter)
" ============
let g:ale_enabled = 1

" Run linter only after save the file
let g:ale_lint_on_text_changed = 'never'

" Don't run linter after open a file
let g:ale_lint_on_enter = 0

" Navigate between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" Omnicompletion languages plugins
" ================================
"
" C/C++ -> clang-complete
" path to directory where library can be found
let g:clang_library_path = '/usr/lib'
let g:clang_complete_auto = 1

" Python -> jedi-vim
" use tabs when going to a definition etc
let g:jedi#use_tabs_not_buffers = 1

" Disable docstring window to popup during completion
autocmd FileType python setlocal completeopt-=preview

" JavaScript -> vim-javascript
let g:javascript_plugin_flow = 1

" HTML/CSS -> vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" Go -> vim-go
" disable `auto |:GoFmt|` on save
let g:go_fmt_autosave = 0

" enable some features for syntax highlighting
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1



" =========================================================
" Status line
" =========================================================

" lightline
" =========
"
" Disable mode information under status line
set noshowmode

" Settings
let g:lightline = {
    \ 'colorscheme': 'molokai',
    \ 'component_function': {
    \     'filetype': 'MyFiletype',
    \     'fileformat': 'MyFileformat',
    \ }
    \ }

" functions for vim-devicons
"function! MyFiletype()
"    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
"endfunction
"
"function! MyFileformat()
"    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
"endfunction


" =========================================================
" Keymapping
" =========================================================

" Reload neovim config with Ctrl+r without restart
map \r :source ~/.config/nvim/init.vim<CR>

" Cancel a search with F3
nnoremap <silent> <F3> :nohl<CR>

" Press kk to exit.
inoremap kk <Esc>

" Don't use arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Fast saving
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Move around splits using Ctrl + {h,j,k,l}
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" NerdTree
" ========
"
" Open NERDTree automatically when neovim starts up
"autocmd vimenter * NERDTree

" Open/close NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>


" tagbar
" ======
"
" Open/close tagbar with Ctrl+m
nmap <C-m> :TagbarToggle<CR>
