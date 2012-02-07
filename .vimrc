" vimrc
" Zhiqiang Ma, http://fclose.com/zma/

set number              " show line number

set backup              " keep a backup file
set backupdir=~/.vimbackup " keep all backup files in one central dir
set backupcopy=yes

" Tab setting, space is preferred
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4

set nocompatible

" set linebreak
" set textwidth=72
set wrap

"set autoindent          " always set autoindenting on
"set cindent             " indent c code

syntax on

set incsearch           " do incremental searching
set hlsearch            " high light the search content

set history=500         " keep 50 lines of command line history

set number
set ruler               " show the cursor position all the time
set rulerformat=%15(%c%V\ %p%%%)

set showcmd             " display incomplete commands

set fileencodings=utf-8,gbk,ucs-bom,latin1  " good for Chinese charactor

" set mouse=a             " move cursor by mouse click

set autoread

" =============
" Key Shortcut
" =============
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>
nmap W :w<CR>
nmap Q :q<CR>

" Ctrl-T for spell check with aspell
map  :w!<CR>:!aspell check %<CR>:e! %<CR>

" setlocal spell spelllang=en

au BufEnter *.cpp setf cpp
au BufEnter *.c++ setf cpp
au BufEnter *.cc setf cpp
au BufEnter *.h setf cpp
au BufEnter *.c setf c
au BufEnter *.tex setf tex
au BufEnter *.txt setf txt
au BufEnter *.bib setf bib

au FileType mail call FT_mail()
au FileType cpp,c,java,x10,pl,php,asp call FT_c()
au FileType tex call FT_tex()
au FileType txt call FT_txt()
au FileType bib call FT_bib()

function FT_mail()
    set textwidth=10000000000
    " reformat for 72 char lines
    " normal gggqGgg
    " settings
    set spell spelllang=en
    set fileencodings=iso8859-1,utf-8
    " abbreviations
    " iabbr <buffer> gd Good Day!
endfunction

function FT_tex()
    " set textwidth=72
    " reformat for 72 char lines
    " normal gggqGgg
    " settings
    set spell spelllang=en
    " setlocal fileencoding=iso8859-1,utf-8
    set fileencodings=iso8859-1,utf-8
endfunction

function FT_txt()
    set textwidth=68
    " reformat for 80 char lines
    " normal gggqGgg
    " settings
    set spell spelllang=en
    " setlocal fileencoding=iso8859-1,utf-8
    set fileencodings=iso8859-1,utf-8
endfunction

function FT_bib()
    set nospell
    set fileencodings=iso8859-1,utf-8
endfunction


function FT_c()
    set textwidth=72
    set autoindent          " always set autoindenting on
    set cindent             " indent c code
    set nospell
endfunction

" ============= vim-latex ==================
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" ============= end vim-latex ==============

