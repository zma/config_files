" vimrc
" Zhiqiang Ma, eric [at] pkill.com
" 

set number              " show line number

set backup              " keep a backup file
set backupdir=~/.vibackup " keep all backup files in one central dir
set backupcopy=yes

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4

"set linebreak
set nocompatible
"set textwidth=80
"set wrap

set autoindent          " always set autoindenting on
set cindent             " indent c code

syntax on

set incsearch           " do incremental searching
set hlsearch            " high light the search content

set history=50          " keep 50 lines of command line history

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
"nmap <C-t> :tabnew<CR>
nmap <C-p> :tabprevious<CR>
nmap <C-n> :tabnext<CR>
nmap <C-k> :tabclose<CR>
"nmap <C-Tab> :tabnext<CR>

setlocal spell spelllang=en

au FileType mail call FT_mail()

function FT_mail()
    set nocindent
    set noautoindent
    set textwidth=72
    " reformat for 72 char lines
    " normal gggqGgg
    " settings
    setlocal spell spelllang=en
    setlocal fileencoding=iso8859-1
    " abbreviations
    iabbr <buffer> gd Good Day!
endfunction
