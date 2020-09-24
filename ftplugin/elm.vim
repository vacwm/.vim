" Elm code formatting on save
if get(g:, 'elm_format_autosave', 1)
  augroup elmFormat
    autocmd!
    autocmd BufWritePre *.elm call elm#Format()
    autocmd BufWritePost *.elm call elm#util#EchoStored()
  augroup END
endif

set tabstop=4 shiftwidth=4
