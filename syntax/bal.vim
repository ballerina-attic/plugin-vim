" Vim syntax file " Language:	  Ballerina
" Maintainer:	Dakshika Jayathilaka <sinhaladjs@gmail.com>
" URL:		https://github.com/dakshika/
" Last Change:	2017 Jan 26

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax='bal'
  syn region ballerinaFold start="{" end="}" transparent fold
endif

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ BallerinaHiLink hi link <args>
else
  command! -nargs=+ BallerinaHiLink hi def link <args>
endif

syn keyword ballerinaExternal	    package
syn match   ballerinaExternal	    "\<import\>\(\s\+version\>\)\?"
syn keyword ballerinaConstant     const
syn match   ballerinaLineComment	"//.*"
syn keyword ballerinaConditional	if else try catch fork join timeout
syn keyword ballerinaRepeat       while iterate
syn keyword ballerinaBoolean		  true false
syn keyword ballerinaPriType      boolean int long float double string json xml var any
syn keyword ballerinaNonPriType   message map exception
syn keyword ballerinaOperator     create
syn match   ballerinaAnnotation	  "@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>"
syn region  ballerinaString       start=+"+ end=+"+ end=+$+ contains=@Spell
syn keyword ballerinaStatement    return reply throw break
syn keyword ballerinaScopeDecl    public
syn match   ballerinaNumber		 "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   ballerinaNumber		 "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   ballerinaNumber		 "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   ballerinaNumber		 "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
syn match   ballerinaServiceDecl	"^service\s*\>" contains=ballerinaScopeDecl,ballerinaPriType,ballerinaNonPriType
syn match   ballerinaFuncDef      "^function\s*\>" contains=ballerinaScopeDecl,ballerinaPriType,ballerinaNonPriType
syn match   ballerinaResDef       "resource\s*\>" contains=ballerinaScopeDecl,ballerinaPriType,ballerinaNonPriType
syn match   ballerinaConnectorDef "^connector\s*\>" contains=ballerinaScopeDecl,ballerinaPriType,ballerinaNonPriType
syn match   ballerinaActionDef    "action\s*\>" contains=ballerinaScopeDecl,ballerinaPriType,ballerinaNonPriType
syn match   ballerinaWorkerDef    "worker\s*\>" contains=ballerinaScopeDecl,ballerinaPriType,ballerinaNonPriType

" The default highlighting.
if version >= 508 || !exists("did_ballerina_syn_inits")
  if version < 508
    let did_ballerina_syn_inits = 1
  endif
   BallerinaHiLink ballerinaExternal		  Include
   BallerinaHiLink ballerinaConstant      Constant
   BallerinaHiLink ballerinaConditional		Conditional
   BallerinaHiLink ballerinaLineComment   Comment
   BallerinaHiLink ballerinaRepeat        Repeat
   BallerinaHiLink ballerinaBoolean       Boolean
   BallerinaHiLink ballerinaOperator      Operator
   BallerinaHiLink ballerinaPriType       Type
   BallerinaHiLink ballerinaNonPriType    Type
   BallerinaHiLink ballerinaAnnotation		PreProc
   BallerinaHiLink ballerinaString		    String
   BallerinaHiLink ballerinaStatement     Statement
   BallerinaHiLink ballerinaScopeDecl     StorageClass
   BallerinaHiLink ballerinaNumber        Number
   BallerinaHiLink ballerinaServiceDecl   StorageClass
   BallerinaHiLink ballerinaFuncDef       Function
   BallerinaHiLink ballerinaResDef        Function
   BallerinaHiLink ballerinaConnectorDef  Function
   BallerinaHiLink ballerinaActionDef     Function
   BallerinaHiLink ballerinaWorkerDef     Function
endif

delcommand BallerinaHiLink

let b:current_syntax = "bal"

if main_syntax == 'bal'
  unlet main_syntax
endif

let b:spell_options="contained"
