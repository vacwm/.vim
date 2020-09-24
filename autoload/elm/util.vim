fun! elm#util#Echo(title, msg) abort
  redraws! | echon a:title . ' ' | echohl Identifier | echon s:strip_color(a:msg) | echohl None
endf

fun! elm#util#EchoSuccess(title, msg) abort
  redraws! | echon a:title . ' ' | echohl Function | echon s:strip_color(a:msg) | echohl None
endf

fun! elm#util#EchoWarning(title, msg) abort
  redraws! | echon a:title . ' ' | echohl WarningMsg | echon s:strip_color(a:msg) | echohl None
endf

fun! elm#util#EchoError(title, msg) abort
  redraws! | echon a:title . ' ' | echohl ErrorMsg | echon s:strip_color(a:msg) | echohl None
endf

fun! elm#util#EchoLater(func_name, title, msg) abort
  let s:echo_func_name = a:func_name
  let s:echo_title = a:title
  let s:echo_msg = a:msg
endf

fun! elm#util#EchoStored() abort
  if exists('s:echo_func_name') && exists('s:echo_title') && exists('s:echo_msg')
    call elm#util#{s:echo_func_name}(s:echo_title, s:echo_msg)
    unlet s:echo_func_name
    unlet s:echo_title
    unlet s:echo_msg
  endif
endf

fun! elm#util#CheckBin(bin, url) abort
  let l:binpath = substitute(a:bin, '^\s*\(.\{-}\)\s*$', '\1', '')

  if executable(l:binpath)
    return l:binpath
  endif

  call elm#util#EchoWarning('elm-vim:', 'could not find ' . l:binpath . ' [' . a:url . ']')

  return ''
endf
