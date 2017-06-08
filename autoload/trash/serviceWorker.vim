let register_ = ["if('serviceWorker' in navigator) {",
			\"    navigator.serviceWorker",
			\"             .register(' ')",
			\"             .then(function(){",
			\"    });",
			\"}"]

function! trash#serviceWorker#register() abort
	let l:lnum = line('.')
	call append(l:lnum, register_)
endfunction


