" Highlight operators
syn match Operator "[-+&|=!\/~*%&^?<>]"
hi Operator guifg=#E6B673

" Highlight brackets
"syn match Braces "[{}()\[\]]"
"hi Braces guifg=#E6B673

" Highlight 'self' keyword
syn keyword pythonSelf self
hi def link pythonSelf Special
hi pythonSelf guifg=#36A3D9

" Highlight class names
" Clear default
syn clear pythonStatement

" Set it to what's in the Python file, minus the class.
syn keyword pythonStatement    False None True
syn keyword pythonStatement    as assert break continue del exec global
syn keyword pythonStatement    lambda nonlocal pass print return with yield
syn keyword pythonStatement    def nextgroup=pythonFunction skipwhite

" Now make seperate syntax groups for the class.
syn keyword pythonClassStmt class nextgroup=pythonClass skipwhite
syn match   pythonClass "\h\w*" display contained

" Avoid highlighting attributes as builtins – just added "pythonClass" here.
syn clear pythonAttribute
syn match   pythonAttribute /\.\h\w*/hs=s+1
    \ contains=ALLBUT,pythonBuiltin,pythonFunction,pythonClass,pythonAsync
    \ transparent

" Highlight the class statement and the class name.
hi def link pythonClassStmt Statement
hi pythonClass guifg=#36A3D9
