" vimrc
" Zhiqiang Ma, eric [at] pkill.info

set number              " show line number

set backup              " keep a backup file
set backupdir=~/.vibackup " keep all backup files in one central dir
set backupcopy=yes

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4

" set linebreak
set nocompatible
"set textwidth=80
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

" setlocal spell spelllang=en

au FileType mail call FT_mail()
au FileType cpp,c,java,sh,pl,php,asp call FT_c()
au FileType tex call FT_tex()

function FT_mail()
    set textwidth=68
    " reformat for 72 char lines
    " normal gggqGgg
    " settings
    setlocal spell spelllang=en
    " setlocal fileencoding=iso8859-1,utf-8
    set fileencodings=iso8859-1,utf-8
    " abbreviations
    iabbr <buffer> gd Good Day!
endfunction

function FT_tex()
    set textwidth=72
    " reformat for 72 char lines
    " normal gggqGgg
    " settings
    setlocal spell spelllang=en
    " setlocal fileencoding=iso8859-1,utf-8
    set fileencodings=iso8859-1,utf-8
endfunction

function FT_c()
    set textwidth=72
    set nowrap
    set autoindent          " always set autoindenting on
    set cindent             " indent c code
    setlocal nospell
endfunction

