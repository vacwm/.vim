" Settings    ------------------------------------------------------------------

" Show line numbers on the sidebar 
set number

" Backspace over autoindent, line breaks, start of insert
set backspace=indent,eol,start

syntax on

filetype plugin indent on

" Indentation  -----------------------------------------------------------------
set expandtab tabstop=2 shiftwidth=2

" Color        -----------------------------------------------------------------
hi CocWarningSign ctermfg=11 guifg=Yellow 	

" Autosave     -----------------------------------------------------------------
let g:elm_format_autosave = 1
