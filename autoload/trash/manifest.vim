let s:ANDROID_MANIFEST_HEAD='<link rel="manifest" href="/manifest.json">'
let s:ANDROID_MANIFEST_HEAD_COMMENT='<!-- android manifest head -->'
let s:IOS_MANIFEST_HEAD=["<meta name=\"apple-mobile-web-app-capable\" content=\"yes\">",
			\"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">",
			\"<meta name=\"apple-mobile-web-app-title\" content=\" \">",
			\"<link rel=\"apple-touch-icon\" href=\" \">"]
let s:IOS_MANIFEST_HEAD_COMMENT='<!-- Add to home screen for Safari on iOS -->'
let s:WIN_MANIFEST_HEAD=["<meta name='msapplication-TileImage' content=' '>",
			\"<meta name='msapplication-TileColor' content=' '>"]
let s:WIN_MANIFEST_HEAD_COMMENT='<!-- Windows manifest head -->'

function! trash#manifest#insert() abort
	call trash#utils#copy_from_assert('manifest')
endfun

function! trash#manifest#insert_head_to_html() abort
	let head_ = [s:ANDROID_MANIFEST_HEAD_COMMENT, '', s:ANDROID_MANIFEST_HEAD, '', '',
				\s:IOS_MANIFEST_HEAD_COMMENT, '', s:IOS_MANIFEST_HEAD, '', '',
				\s:WIN_MANIFEST_HEAD_COMMENT, '', s:WIN_MANIFEST_HEAD, '', '']
	let head_re = '\m<\<head\>.*>'
	let insert_lnm = search(head_re)
	call trash#utils#deep_append(insert_lnm, head_)
endfun
