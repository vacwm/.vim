" Vim command to format Elm files with elm-format
fun! elm#Format() abort
	" check for elm-format
	if elm#util#CheckBin('elm-format', 'https://github.com/avh4/elm-format') ==# ''
		return
	endif

	" save cursor position, folds and many other things
  let l:curw = {}
  try
    mkview!
  catch
    let l:curw = winsaveview()
  endtry

  " save our undo file to be restored after we are done.
  let l:tmpundofile = tempname()
  exe 'wundo! ' . l:tmpundofile

	" write current unsaved buffer to a temporary file
	let l:tmpname = tempname() . '.elm'
	call writefile(getline(1, '$'), l:tmpname)

	" call elm-format on the temporary file
	let l:out = system('elm-format ' . l:tmpname . ' --output ' . l:tmpname)

	" if there is no error
	if v:shell_error == 0
		try | silent undojoin | catch | endtry

		" replace current file with temp file, then reload buffer
		let l:old_fileformat = &fileformat
		call rename(l:tmpname, expand('%'))
		silent edit!
		let &fileformat = l:old_fileformat
		let &syntax = &syntax
	elseif g:elm_format_fail_silently == 0
		call elm#util#EchoLater('EchoError', 'elm-format:', l:out)
	endif

  " save our undo history
  silent! exe 'rundo ' . l:tmpundofile
  call delete(l:tmpundofile)

	" restore our cursor/windows positions, folds, etc..
  if empty(l:curw)
    silent! loadview
  else
    call winrestview(l:curw)
  endif
endf

