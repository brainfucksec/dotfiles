" =========================================================
"
"  ██▓ ███▄    █  ██▓▄▄▄█████▓      ██▒   █▓ ██▓ ███▄ ▄███▓
" ▓██▒ ██ ▀█   █ ▓██▒▓  ██▒ ▓▒     ▓██░   █▒▓██▒▓██▒▀█▀ ██▒
" ▒██▒▓██  ▀█ ██▒▒██▒▒ ▓██░ ▒░      ▓██  █▒░▒██▒▓██    ▓██░
" ░██░▓██▒  ▐▌██▒░██░░ ▓██▓ ░        ▒██ █░░░██░▒██    ▒██
" ░██░▒██░   ▓██░░██░  ▒██▒ ░  ██▓    ▒▀█░  ░██░▒██▒   ░██▒
" ░▓  ░ ▒░   ▒ ▒ ░▓    ▒ ░░    ▒▓▒    ░ ▐░  ░▓  ░ ▒░   ░  ░
"  ▒ ░░ ░░   ░ ▒░ ▒ ░    ░     ░▒     ░ ░░   ▒ ░░  ░      ░
"  ▒ ░   ░   ░ ░  ▒ ░  ░       ░        ░░   ▒ ░░      ░
"  ░           ░  ░             ░        ░   ░         ░
"                               ░       ░
"
" neovim configuration file
"
" Version: 0.1.0-dev - 2019/09/06
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

" Set ctermbg to none
highlight NonText ctermbg=none

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


" =========================================================
" Colors and fonts
" =========================================================

" Terminal options
set t_Co=256
"set termguicolors

" Colorscheme
colorscheme wal


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


" =========================================================
" Text, tabs, indent
" =========================================================

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" 1 tab == 2 spaces for selected filetypes
autocmd FileType xml,html,xhtml,css setlocal shiftwidth=2 tabstop=2

set si "Smart indent
set wrap "Wrap lines


" indentLine
" ==========
" indent lines style
let g:indentLine_char = '│'
"let g:indentLine_setColors = 0


" =========================================================
" Autocompletion, linting
" =========================================================

" General settings for completion
" ================================

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

" C/C++
" - clang-complete
" path of clang library file (change this after a update of clang)
let g:clang_library_path = '/usr/lib/libclang.so.8'
let g:clang_complete_auto = 1

" JavaScript
" - vim-javascript
let g:javascript_plugin_flow = 1

" HTML/CSS
" - vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


" =========================================================
" Status line
" =========================================================

" lightline
" =========
" Disable mode information under status line
set noshowmode

" Settings
let g:lightline = {
    \ 'colorscheme': '16color',
    \ 'component_function': {
    \     'filetype': 'MyFiletype',
    \     'fileformat': 'MyFileformat',
    \ }
    \ }

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction


" =========================================================
" Keymapping
" =========================================================

" Reload neovim config with Ctrl+r without restart
map \r :source ~/.config/nvim/init.vim<CR>

" Cancel a search with Ctrl+l
nnoremap <silent> <C-l> :nohl<CR><C-l>

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


" NerdTree
" ========
" Open NERDTree automatically when neovim starts up
"autocmd vimenter * NERDTree

" Open/close NerdTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
