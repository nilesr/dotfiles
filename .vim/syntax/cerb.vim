" test

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'cerb'
endif



if !exists("b:eruby_nest_level")
  let b:eruby_nest_level = strlen(substitute(substitute(substitute(expand("%:t"),'@','','g'),'\c\.\%(cerb\)\>','@','g'),'[^@]','','g'))
endif
if !b:eruby_nest_level
  let b:eruby_nest_level = 1
endif

runtime! syntax/html.vim
unlet! b:current_syntax
syn include @cTop syntax/c.vim

syn cluster erubyRegions contains=cerbPre,cerbBlock,cerbExpr,cerbComment

exe 'syn region  cerbPre        matchgroup=cerbDelimiter start="<%!\{1,'.b:eruby_nest_level.'\}%\@!-\=" end="[=-]\=%\@<!%\{1,'.b:eruby_nest_level.'\}>" contains=@cTop  containedin=ALLBUT,@erubyRegions keepend'
exe 'syn region  cerbBlock      matchgroup=cerbDelimiter start="<%\{1,'.b:eruby_nest_level.'\}%\@!-\=" end="[=-]\=%\@<!%\{1,'.b:eruby_nest_level.'\}>" contains=@cTop  containedin=ALLBUT,@erubyRegions keepend'
exe 'syn region  cerbExpr       matchgroup=cerbDelimiter start="<%\{1,'.b:eruby_nest_level.'\}=\{1,4}" end="[=-]\=%\@<!%\{1,'.b:eruby_nest_level.'\}>" contains=@cTop  containedin=ALLBUT,@erubyRegions keepend'
exe 'syn region  cerbComment    matchgroup=cerbDelimiter start="<%\{1,'.b:eruby_nest_level.'\}-\=//"    end="[=-]\=%\@<!%\{1,'.b:eruby_nest_level.'\}>" contains=cTodo,@Spell containedin=ALLBUT,@erubyRegions keepend'

" Define the default highlighting.

hi def link cerbDelimiter		PreProc
hi def link cerbComment		Comment

let b:current_syntax = 'cerb'

if main_syntax == 'cerb'
  unlet main_syntax
endif

" vim: nowrap sw=2 sts=2 ts=8:

