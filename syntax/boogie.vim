" Vim syntax file
" Language:     BoogiePL
" Maintainer:   Michal Moskal <Michal.Moskal@microsoft.com>
"               Chiao Hsieh <hc825b@gmail.com>
" Filenames:    *.bpl

" Comments: 
" Make sure to create a file name .vim/ftdetect/bpl.vim containing this line:
" au BufRead,BufNewFile *.bpl set filetype=boogie

if exists("b:current_syntax")
    finish
endif

let s:bpl_cpo_save = &cpo
set cpo&vim

" type
syn keyword bplType     bool int real
" repeat / condition / label
syn keyword bplExpr     forall exists cast returns lambda div mod
syn keyword bplStmt     goto return while call else if assert assume havoc then 
syn keyword bplDecl     axiom function procedure type requires ensures modifies unique const var free implementation invariant
" user labels
syn match   bplLabel    display +^\s*\I\i*\s*:\([^:=]\|$\)\@=+
syn keyword bplBoolLit  false true

" Comments
"
" PROVIDES: @bplCommentHook
"
" TODO: include strings ?
"
syn keyword bplTodo     contained TODO FIXME XXX NOTE
syn region  bplComment  start="/\*"  end="\*/" contains=@bplCommentHook,bplTodo,@Spell
syn match   bplComment  "//.*$" contains=@bplCommentHook,bplTodo,@Spell

" [1] 9.5 Pre-processing directives
syn region  bplPreCondit
    \ start="^\s*#\s*\(define\|undef\|if\|elif\|else\|endif\|line\|error\|warning\)"
    \ skip="\\$" end="$" contains=bplComment keepend
syn region  bplRegion matchgroup=bplPreCondit start="^\s*#\s*region.*$"
    \ end="^\s*#\s*endregion" transparent fold contains=TOP


" Strings and constants
syn match   bplSpecialError  contained "\\."
syn match   bplSpecialCharError  contained "[^']"
" [1] 9.4.4.4 Character literals
syn match   bplSpecialChar  contained +\\["\\'0abfnrtvx]+
" unicode characters
syn match   bplUnicodeNumber  +\\\(u\x\{4}\|U\x\{8}\)+ contained contains=bplUnicodeSpecifier
syn match   bplUnicodeSpecifier  +\\[uU]+ contained
syn region  bplVerbatimString  start=+@"+ end=+"+ end=+$+ skip=+""+ contains=bplVerbatimSpec,@Spell
syn match   bplVerbatimSpec  +@"+he=s+1 contained
syn region  bplString    start=+"+  end=+"+ end=+$+ contains=bplSpecialChar,bplSpecialError,bplUnicodeNumber,@Spell
syn match   bplCharacter    "'[^']*'" contains=bplSpecialChar,bplSpecialCharError
syn match   bplCharacter    "'\\''" contains=bplSpecialChar
syn match   bplCharacter    "'[^\\]'"

" TOKENS
syn match   bplIdent     display "\\\?\(\a\|['~#$^_.?`]\)\(\a\|['~#$^_.?`]\|\d\)*"
syn match   bplDigits    "\<\d\+\>"
syn match   bplBVLit     "\<\d\+bv\d\+\>"
syn match   bplDecimal   "\<\d\+[eE][-+]\?\d\+\>"
syn match   bplDecFloat  "\<\d\+\.\d\+\([eE][-+]\?\d\+\)\?\>"
syn match   bplFloat     "\<[-+]\?\d\+[eE][-+]\?\d\+[fF]\d\+[eE]\d\+\>"
syn match   bplFloat     "\<0\(NaN\|nan\|[-+]oo\|[-+]zero\)\d\+[eE]\d\+\>"

" The default highlighting.
hi def link bplType      Type
hi def link bplDecl      Conditional
hi def link bplStmt      Conditional
hi def link bplLabel     Label
hi def link bplExpr      StorageClass
hi def link bplBoolLit   Boolean

hi def link bplTodo      Todo
hi def link bplComment   Comment

hi def link bplSpecialError     Error
hi def link bplSpecialCharError Error
hi def link bplString           String
hi def link bplVerbatimString   String
hi def link bplVerbatimSpec     SpecialChar
hi def link bplPreCondit        PreCondit
hi def link bplCharacter        Character
hi def link bplSpecialChar      SpecialChar
hi def link bplDigits           Number
hi def link bplBVLit            Number
hi def link bplDecimal          Number
hi def link bplDecFloat         Float
hi def link bplFloat            Float
hi def link bplUnicodeNumber    SpecialChar
hi def link bplUnicodeSpecifier SpecialChar

let b:current_syntax = "bpl"

let &cpo = s:bpl_cpo_save
unlet s:bpl_cpo_save

set efm+=%f(%l\\,%c):\ %m

" vim: ts=8
