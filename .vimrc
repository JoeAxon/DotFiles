let g:PHP_vintage_case_default_indent=1

execute pathogen#infect()
syntax on
filetype plugin indent on
set ofu=syntaxcomplete#Complete

set dir=~/.vimswap//,/var/tmp//,/tmp//,.

set undodir=~/.vimundo
set undofile

set nocompatible
set modelines=0

set mouse=a

set encoding=utf-8
set ruler
set cursorline

set lazyredraw

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set cindent
set cinoptions=l1

colors slate

set backspace=2
set backspace=indent,eol,start

set guioptions-=m
set guioptions-=T
set guioptions-=r

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

"------------------------------------------------------------
" CtrlP
"------------------------------------------------------------
" Set the max files
let g:ctrlp_max_files = 10000

" Optimize file searching
if has("unix")
	let g:ctrlp_user_command = {
	\ 'types': {
	\ 1: ['.git/', 'cd %s && git ls-files']
	\ },
	\ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
	\ }
endif

"------------------------------------------------------------
" Strip whitespace on save
"------------------------------------------------------------
autocmd BufWritePre * :%s/\s\+$//e

"------------------------------------------------------------
" Toggle Tabs and Spaces
"------------------------------------------------------------
function TabToggle()
    if &expandtab
        set noexpandtab
    else
        set expandtab
    endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

"------------------------------------------------------------
" Custom Status Line
"------------------------------------------------------------
set statusline=[%t]
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=[%l,%c]/%L
set laststatus=2

"------------------------------------------------------------
" Git Commit
"------------------------------------------------------------
nmap <F4> :Gcommit<CR>

"------------------------------------------------------------
" PHP Syntax Checker
"------------------------------------------------------------
nmap <F5> :!php -l %<CR>

"------------------------------------------------------------
" Tagbar Toggle
"------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
