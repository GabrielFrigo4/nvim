" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Set guicursor style
au VimEnter,VimResume * set guicursor=n-c:block,i-ci-ve:ver25,r-cr:hor10,o:hor50,v:hor10
  \,a:blinkwait500-blinkoff500-blinkon500-Cursor/lCursor
au VimLeave,VimSuspend * set guicursor=