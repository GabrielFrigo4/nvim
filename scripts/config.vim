" ============================================================================
"  1. CONFIGURAÇÕES INICIAIS
" ============================================================================ {{{

" --- Essenciais do Vim ---
set nocompatible              " Desativa modo de compatibilidade com VI antigo
filetype plugin indent on     " Habilita detecção de arquivos, plugins e indentação
syntax on                     " Habilita destaque de sintaxe (cores)

" --- Estilo do Cursor (Terminal) ---
" Muda o formato do cursor dependendo do modo (Normal, Inserção, Substituição)
let &t_SI = "\<Esc>[5 q"      " Insert Mode: Barra vertical (|)
let &t_SR = "\<Esc>[3 q"      " Replace Mode: Sublinhado (_)
let &t_EI = "\<Esc>[1 q"      " Normal Mode: Bloco (█)

" }}}
