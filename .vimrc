" ~/.vimrc
" Zhiqiang (Eric) Ma, http://www.ZhiqiangMa.com

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

set number
" show the cursor position all the time
" set ruler
" set rulerformat=%15(%c%V\ %p%%%)

:set laststatus=2
" :set statusline+=%(%{Tlist_Get_Tagname_By_Line()}%) " Function name
" :set statusline=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%)
:set statusline=%<%([%{Tlist_Get_Tagname_By_Line()}]%)%=%(%c%V\ %p%%%)\ %f

" taglist
" let Tlist_Auto_Open=1

filetype indent off
autocmd BufRead,BufNewFile * filetype indent off

autocmd BufRead,BufNewFile *.h filetype indent on
autocmd BufRead,BufNewFile *.c filetype indent on
autocmd BufRead,BufNewFile *.cpp filetype indent on
autocmd BufRead,BufNewFile *.cc filetype indent on
autocmd BufRead,BufNewFile *.sh filetype indent on
autocmd BufRead,BufNewFile *.bash filetype indent on
autocmd BufRead,BufNewFile *.py filetype indent on
" autocmd BufRead,BufNewFile *.ml filetype indent off

"set autoindent          " always set autoindenting on
"set cindent             " indent c code

" omni completion
set ofu=syntaxcomplete#Complete

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" tags
set tags=tags;/

" ==== Start Autotags Settings =======
let g:autotags_no_global = 0
let g:autotags_ctags_opts = "--exclude=target --exclude=vendor"
let g:autotags_ctags_languages = "+Scala,+Java,+Vim,+C,+CH,+CC,+CPP"
let g:autotags_ctags_langmap = "Scala:.scala,Java:.java,Vim:.vim,JavaScript:.js,C:.c,CH:.h,CC:.cc,CPP:cpp"
let g:autotags_ctags_global_include = ""
" ==== End Start Autotags Settings ===

" setlocal spell spelllang=en

" ------------- LustyJuggler: no warning on vims without Ruby ---------
let g:LustyJugglerSuppressRubyWarning = 1
" ------------- End LustyJuggler: no warning on vims without Ruby ---------

" ========= Key Shortcuts =========
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>
nmap W :w<CR>
" nmap Q :TlistClose<CR> :q<CR> 
nmap Q :q<CR> 

" F2 in insert mode for paste toggle
set pastetoggle=<F2>

" F2 for NERDtree
" map <F2> :execute 'NERDTreeToggle ' . getcwd()<CR>
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


" ======== language specific settings ===========

au BufEnter *.cpp setf cpp
au BufEnter *.c++ setf cpp
au BufEnter *.cc setf cpp
au BufEnter *.hpp setf cpp
au BufEnter *.h setf c
au BufEnter *.c setf c
au BufEnter *.tex setf tex
au BufEnter *.txt setf txt
au BufEnter *.bib setf bib
au BufEnter *.php setf php
au BufEnter *.ml setf ocaml
au BufEnter *.mli setf ocaml
au BufEnter *.scala setf scala

au FileType mail call FT_mail()
au FileType cpp call FT_cpp()
au FileType c call FT_c()
au FileType php call FT_php()
au FileType tex call FT_tex()
au FileType txt call FT_txt()
au FileType bib call FT_bib()
au FileType ocaml call FT_ocaml()
au FileType scala call FT_scala()

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
    " settings
    set spell spelllang=en
    " setlocal fileencoding=iso8859-1,utf-8
    set fileencodings=iso8859-1,utf-8

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
    " settings
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
    set noautoindent          " always set autoindenting on
    set nocindent             " indent c code
    set nospell
endfunction

" ------------- C/C++ ----------------------------
function FT_c()
    " disable auto comment for c/cpp
    setlocal comments-=:// comments+=f://
    set shiftwidth=4
    set tabstop=4
    " the textwidth is used for formatting the comments
    set textwidth=72
    set colorcolumn=73
    set autoindent          " always set autoindenting on
    set cindent             " indent c code
    set nospell
endfunction

function FT_cpp()
    " disable auto comment for c/cpp
    setlocal comments-=:// comments+=f://
    set shiftwidth=2
    set tabstop=2
    set textwidth=72
    set colorcolumn=73
    set autoindent          " always set autoindenting on
    set cindent             " indent c code
    set nospell
endfunction

" syntastic
let g:syntastic_cpp_compiler_options = ' -std=c++11'
"
" ------------- End C/C++ ----------------------------

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
    set colorcolumn=81
    set shiftwidth=2
    set tabstop=2
    " must before plugin indent on
    filetype indent on
    filetype plugin indent on

    " merlin with core
    " execute ":Use core"
endfunction

" ------------------ End OCaml --------------------

" ------------------ Scala --------------------

function FT_scala()
    set colorcolumn=81
    set shiftwidth=2
    set tabstop=2
    filetype indent on
    filetype plugin indent on
    " neocomplcache for scala
    " let g:neocomplcache_force_omni_patterns.scala = '[^. *\t]\.\w*\|\h\w*|#'
endfunction

" ------------------ End Scala --------------------

