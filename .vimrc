" ~/.vimrc
" Eric Zhiqiang Ma, http://www.ericzma.com

set nocompatible

filetype on
filetype plugin on


syntax on

" pathogen
execute pathogen#infect()

" file autocomplete
set wildmode=longest,list,full
set wildmenu

" show line number
set number

" backup
" keep a backup file
set backup
" create the vimbackup dir if it does not exist
let t:check_vimbackup=system("bash -c \"if [ ! -d ~/.vimbackup ]; then mkdir ~/.vimbackup; fi\"")
" keep all backup files in one central dir
set backupdir=~/.vimbackup
set backupcopy=yes

" Default Tab setting, space is preferred
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4

" set linebreak
" set textwidth=72
set wrap

" do incremental searching
set incsearch
" high light the search content
set hlsearch

" keep N lines of command line history
set history=5120

" display incomplete commands
" set showcmd

" good for Chinese charactor
set fileencodings=utf-8,gbk,ucs-bom,latin1

" move cursor by mouse click
" set mouse=a

" set autoread

" show line number
set number

" status bar
set laststatus=2
set statusline=%<%([%{Tlist_Get_Tagname_By_Line()}]%)\ %t%=%c,%l/%L\ %P\ %F\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y

" indent settings
" turn this to on to make indent work
filetype indent on

" by default, turn it off
" and leave turning indent on in each language's config in FT_*()
autocmd BufRead,BufNewFile * filetype indent off

" omni completion
set ofu=syntaxcomplete#Complete

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" taglist: auto open
let Tlist_Auto_Open = 1
" auto close Tlist window if it is the only window
let Tlist_Exit_OnlyWindow = 1

" where to find the tags file
set tags=tags;/

" ==== Start AutoTag Settings =======
let g:autotags_no_global = 0
let g:autotags_ctags_opts = "--exclude=target --exclude=vendor"
let g:autotags_ctags_languages = "+Scala,+Java,+Vim,+C,+CH,+CC,+CPP"
let g:autotags_ctags_langmap = "Scala:.scala,Java:.java,Vim:.vim,JavaScript:.js,C:.c,CH:.h,CC:.cc,CPP:cpp"
let g:autotags_ctags_global_include = ""
" ==== End Start AutoTag Settings ===

" setlocal spell spelllang=en

" ------------- LustyJuggler: no warning on vims without Ruby ---------
let g:LustyJugglerSuppressRubyWarning = 1
" ------------- End LustyJuggler: no warning on vims without Ruby ---------

" syntastic
let g:syntastic_check_on_wq = 1

" NERDTree on the right
let NERDTreeWinPos="right"

" Open NERDTree by default
autocmd VimEnter * NERDTree
" after opening the NERDTree, move the cursor to the main window
autocmd VimEnter * wincmd p

" ========= Key Shortcuts =========
nmap W :w<CR>
" close NERDTree and close it
nmap Q :NERDTreeClose<CR> :q<CR> 
nmap ZZ :q<CR> 

nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>

" F2 in insert mode for paste toggle 
set pastetoggle=<F2>

" F2 for NERDTree
map <F2> :execute 'NERDTreeTabsToggle'<CR>

" F3 for taglist
map <F3> :TlistToggle <CR>

" lustyjuggler
map <F4> :LustyJuggler <CR>

" F5 for spell check with aspell
map <F5> :w!<CR>:!aspell check %<CR>:e! %<CR>

" make
map <F7> :make! <CR> :cwindow <CR>
" display the output and wait for <CR>
map <C-F7> :make <CR> :cwindow <CR>

" gen tags in vim
map <F8>   :!find . -maxdepth 1 -regex '.*\.\(c\<bar>h\<bar>cc\<bar>hh\<bar>cpp\<bar>hpp\<bar>ml\<bar>mli\)' <bar> /usr/bin/ctags --c++-kinds=+p --fields=+iaS --extra=+q -L-<CR>
map <C-F8> :!find .             -regex '.*\.\(c\<bar>h\<bar>cc\<bar>hh\<bar>cpp\<bar>hpp\<bar>ml\<bar>mli\)' <bar> /usr/bin/ctags --c++-kinds=+p --fields=+iaS --extra=+q -L-<CR>

" number toggle
map <F10> :let &number=1-&number <CR>

" ========= End Key Shortcuts =========

" ======== language specific settings ===========

autocmd BufEnter *.cpp setf cpp
autocmd BufEnter *.c++ setf cpp
autocmd BufEnter *.cc setf cpp
autocmd BufEnter *.hpp setf cpp
autocmd BufEnter *.h setf c
autocmd BufEnter *.c setf c
autocmd BufEnter *.tex setf tex
autocmd BufEnter *.txt setf txt
autocmd BufEnter *.bib setf bib
autocmd BufEnter *.php setf php
autocmd BufEnter *.ml setf ocaml
autocmd BufEnter *.mli setf ocaml
autocmd BufEnter *.scala setf scala
autocmd BufEnter *.bash setf sh
autocmd BufEnter *.sh setf sh

autocmd FileType mail call FT_mail()
autocmd FileType cpp call FT_cpp()
autocmd FileType c call FT_c()
autocmd FileType php call FT_php()
autocmd FileType tex call FT_tex()
autocmd FileType txt call FT_txt()
autocmd FileType bib call FT_bib()
autocmd FileType ocaml call FT_ocaml()
autocmd FileType scala call FT_scala()
autocmd FileType sh call FT_sh()

function FT_sh()
    set autoindent
    filetype indent on
    filetype plugin indent on
endfunction

function FT_mail()
    set textwidth=100000000000
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
    set spell spelllang=en
    set fileencodings=iso8859-1,utf-8
    " setlocal fileencoding=iso8859-1,utf-8

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
endfunction

function FT_txt()
    " set textwidth=68
    " reformat for 80 char lines
    " normal gggqGgg
    " set spell spelllang=en
    set nospell
    " setlocal fileencoding=iso8859-1,utf-8
    set fileencodings=iso8859-1,utf-8
endfunction

function FT_bib()
    set nospell
    set fileencodings=iso8859-1,utf-8
endfunction

function FT_php()
    set textwidth=100000000000
    " set textwidth=72
    set noautoindent
    set nocindent
    set nospell
endfunction

" ------------- C ----------------------------
function FT_c()
    " disable auto comment for C 
    setlocal comments-=:// comments+=f://
    set shiftwidth=4
    set tabstop=4
    " the textwidth is used for formatting the comments
    set textwidth=72
    set colorcolumn=72
    set autoindent
    set cindent
    set nospell
endfunction
" ------------- End C ----------------------------

" ------------- C++ ----------------------------
function FT_cpp()
    " disable auto comment for cpp
    setlocal comments-=:// comments+=f://
    set shiftwidth=2
    set tabstop=2
    set textwidth=72
    set colorcolumn=72
    set autoindent
    set cindent
    set nospell
endfunction

" syntastic
let g:syntastic_cpp_compiler_options = ' -std=c++11'
"
" ------------- End C++ ----------------------------

" ------------------ OCaml --------------------

" ocp-indent with ocp-indent-vim
let s:opamshare=system("opam config var share | tr -d '\n'")
execute "autocmd FileType ocaml source ".s:opamshare."/vim/syntax/ocp-indent.vim"

let s:opamshare=system("opam config var share | tr -d '\n'")
" merlin
execute "set rtp+=".s:opamshare."/ocamlmerlin/vim"
execute "set rtp+=".s:opamshare."/ocamlmerlin/vimbufsync"

" merlin with syntastic
let g:syntastic_ocaml_checkers=['merlin']

" merlin with neocomplcache
" if !exists('g:neocomplcache_force_omni_patterns')
"   let g:neocomplcache_force_omni_patterns = {}
" endif
" let g:neocomplcache_force_omni_patterns.ocaml = '[^. *\t]\.\w*\|\h\w*|#'

" syntastic
let g:syntastic_ocaml_use_ocamlc = 1
let g:syntastic_ocaml_use_janestreet_core = 1
let s:opamlib=system("opam config var lib | tr -d '\n'")
execute "let g:syntastic_ocaml_janestreet_core_dir = \"".s:opamlib."/core/\""
let g:syntastic_ocaml_camlp4r = 1
let g:syntastic_ocaml_use_ocamlbuild = 1

function FT_ocaml()
    " set textwidth=80
    set colorcolumn=80
    set shiftwidth=2
    set tabstop=2
    set autoindent
    " must before plugin indent on
    filetype indent on
    filetype plugin indent on

    " merlin with core
    " execute ":Use core"
endfunction

" ------------------ End OCaml --------------------

" ------------------ Scala --------------------

" disable syntastic for scala---it is too slow
" use sbt instead
let g:syntastic_scala_checkers=['']

function FT_scala()
    set colorcolumn=80
    set shiftwidth=2
    set tabstop=2
    set autoindent
    filetype indent on
    filetype plugin indent on
    " neocomplcache for scala
    " let g:neocomplcache_force_omni_patterns.scala = '[^. *\t]\.\w*\|\h\w*|#'
endfunction

" ------------------ End Scala --------------------

