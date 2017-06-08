function! trash#vScript#gen_prefix() abort
	let l:fullname = expand('%:p:r')
	if(l:fullname !~# 'autoload')
		throw "not in autoload diractory"
	endif
	let l:slash_prefix = split(l:fullname, 'autoload/')[1]
	let l:_prefix = substitute(slash_prefix, '/', '#', 'g')
	return l:_prefix.'#'
endfun

function! trash#vScript#insert_prefix() abort
	try
		let prefix = trash#vScript#gen_prefix()
	catch /.*/
		throw v:exception
	endtry
	let l:lnum = line('.')
	let l:cur_line = getline(l:lnum)
	let l:_line = l:cur_line.' '.prefix
	call setline(l:lnum, l:_line)
endfun
