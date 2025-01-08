" Backspace in normal mode
nnoremap <expr> <Backspace> col('.') == 1 ? 'kgJ' : 'X'