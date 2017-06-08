let s:local_dir = expand("<sfile>:p:h")
fun trash#utils#assert_dir() abort
	return s:local_dir.'/assert'
endfun

fun trash#utils#copy_from_assert(filename) abort
	let l:assert_dir = trash#utils#assert_dir()
	let l:full_name = l:assert_dir.'/'.a:filename
	exec '0read '.l:full_name
endfun

fun trash#utils#find_holder() abort
	let back_ = &hlsearch
	set hlsearch
	let l:holder_re = '"\@<=\s"\@='
	call search(l:holder_re, 'w')
endfun

fun trash#utils#deep_append(lnum, lines) abort
	let l:inum = a:lnum
	for line in a:lines
		if type(line) == 1
			call append(l:inum, line)
			let l:inum = l:inum+1
		elseif type(line) == 3
			let l:inum =  trash#utils#deep_append(l:inum, line)
		endif
		unlet line
	endfor
	return l:inum
endfun
