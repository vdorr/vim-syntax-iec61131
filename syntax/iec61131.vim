
"http://vimdoc.sourceforge.net/htmldoc/syntax.html
"http://vimregex.com/

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn case ignore
syn sync lines=250

syn keyword iecBoolean	true false
syn keyword iecConditional	if else then end_if
syn keyword iecConstant	null
syn keyword iecLabel		case end_case return jmp jmpc jmpcn
syn keyword iecOperator	and or xor not div mod
syn keyword iecRepeat	for do repeat while to until end_for end_while end_repeat by exit continue

syn keyword iecStatement	function end_function
syn keyword iecStatement	function_block end_function_block
syn keyword iecStatement	program end_program

syn keyword iecStruct	struct end_struct
syn keyword iecKeyword	configuration end_configuration var_access var_external var_input var_output var_in_out var end_var

syn keyword iecKeyword read_write read_only

syn keyword iecStorageClass	at const retain non_retain

"TODO maybe should be restricted to configuration, check if all are keywords
syn keyword iecKeyword task with priority interval single

syn keyword iecKeyword array of
syn keyword iecType  bool int uint usint string wstring float word dword

syn keyword iecType ton tof sr rs

syntax match iecTypePrefix "t\#"

syntax region  iecString	contains=@Spell,iecEscape,iecEscWide start=+"+ skip=+""+ end=+"+ 
syntax region  iecString	contains=@Spell,iecEscape,iecEscShort start=+'+ skip=+''+ end=+'+ 

"TODO rest of escapes
syntax match iecEscape contained "\$[\$tn]"
syntax match iecEscShort contained "\$\x\x"
syntax match iecEscShort contained "\$\'"
syntax match iecEscWide contained "\$\x\x\x\x"
syntax match iecEscWide contained "\$\""

syntax region  iecComment 
    \ oneline 
    \ contains=@Spell,iecTodo
    \ start="//" 
    \ end="$"


syntax region  iecComment 
    \ contains=@Spell,iecTodo
    \ start="/\*"
    \ end="\*/"

syntax region  iecComment  contains=@Spell,iecTodo start="(\*" end="\*)"

syntax region  iecPreproc start="{" end="}"

syn keyword iecTodo contained	TODO FIXME XXX DEBUG NOTE


syntax match   iecNumber		"\<\d[0-9_]*\(\.\d[0-9_]*\)\=\([Ee][+-]\=\d[0-9_]*\)\=\>"
"syntax match   iecNumber		"\<\d\d\=#\x[0-9A-Fa-f_]*\(\.\x[0-9A-Fa-f_]*\)\=#\([Ee][+-]\=\d[0-9_]*\)\="
syntax match   iecNumber		"\<\d\d\=#\x[0-9A-Fa-f_]*\(\.\x[0-9A-Fa-f_]*\)\="

highlight def link iecTypePrefix	Type

highlight def link iecEscape	    Special
highlight def link iecEscShort	    Special
highlight def link iecEscWide    Special

highlight def link iecCharacter	    Character
highlight def link iecComment	    Comment
highlight def link iecConditional   Conditional
highlight def link iecKeyword	    Keyword
highlight def link iecLabel	    Label
highlight def link iecNumber	    Number
highlight def link iecSign	    Number
highlight def link iecOperator	    Operator
highlight def link iecPreproc	    PreProc
highlight def link iecRepeat	    Repeat
highlight def link iecSpecial	    Special
highlight def link iecStatement	    Statement
highlight def link iecString	    String
highlight def link iecStructure	    Structure
highlight def link iecTodo	    Todo
highlight def link iecType	    Type
highlight def link iecTypedef	    Typedef
highlight def link iecStorageClass  StorageClass
highlight def link iecBoolean	    Boolean

highlight def link iecAttribute	    Tag
highlight def link iecInc	    Include
highlight def link iecError	    Error
highlight def link iecSpaceError    Error
highlight def link iecLineError	    Error
highlight def link iecBuiltinType   Type
highlight def link iecAssignment    Special


