" vimrc
" Zhiqiang Ma, eric.zq.ma [at] gmail.com
" 

set number              " show line number

set backup              " keep a backup file
set backupdir=~/.vibackup " keep all backup files in one central dir
set backupcopy=yes

set tabstop=4
set shiftwidth=4
set expandtab

set autoindent          " always set autoindenting on
set nocindent           " no indent c code
syntax on

set incsearch           " do incremental searching
set hlsearch            " high light the search content

set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands

set fileencodings=utf-8,gbk,ucs-bom,latin1  " good for Chinese charactor

