" DEFAULT -------------------------------------------------------------- {{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Load an indent file for the detected file type.
filetype indent on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Enable plugins and load plugin for indent the detected file type.
filetype plugin indent on

" Turn syntax highlighting on.
syntax on

" Set guicursor style
au VimEnter,VimResume * set guicursor=n-c:block,i-ci-ve:ver10,r-v:hor10
  \,a:blinkwait500-blinkoff500-blinkon500-Cursor/lCursor
au VimLeave,VimSuspend * set guicursor=

" Set terminal cursor style
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable code folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
