
"http://vimdoc.sourceforge.net/htmldoc/syntax.html
"http://vimregex.com/

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore
syn sync lines=250

" ------------------------------------------------------------------------------

syn keyword iecBoolean	true false
syn keyword iecConditional	if elsif else then end_if
syn keyword iecConstant	null
syn keyword iecLabel		case end_case return jmp jmpc jmpcn
syn keyword iecOperator	and or xor not mod
syn keyword iecRepeat	for do from repeat while to until end_for end_while end_repeat by exit continue

syn keyword iecStatement	function end_function
syn keyword iecStatement	function_block end_function_block
syn keyword iecStatement	program end_program 

syn keyword iecStruct	struct end_struct
syn keyword iecKeyword	configuration end_configuration resource on end_resource

syn keyword iecKeyword	var_global var_access var_external var_input var_output var_in_out var end_var var_temp var_config

syn keyword iecKeyword read_write read_only

syn keyword iecStorageClass	at constant retain non_retain

"TODO maybe should be restricted to configuration, check if all are keywords
syn keyword iecKeyword task with priority interval single

syn keyword iecKeyword array of

syn keyword iecKeyword type end_type struct overlap end_struct ref_to
syn keyword iecKeyword ref this

syn keyword iecKeyword final abstract extends implements override method end_method super
syn keyword iecKeyword class end_class interface end_interface public protected private internal

syn keyword iecKeyword initial_step end_step step transition priority end_transition action end_action
syn keyword iecKeyword namespace end_namespace using 

" ------------------------------------------------------------------------------

syntax region iecTimeLit contains=iecTimePrefix,iecTimeComp,iecTimeUnit
  \ start="t#\|time#\|lt#\|ltime#"
  \ end="\>"

syntax match iecTimePrefix contained "t#\|time#\|lt#\|ltime#"
syntax match iecTimeComp contained "\(\d[0-9_]*\)\(\.\d[0-9_]*\)\=_\="
syn match iecTimeUnit contained "d\|h\|s\|ms\|m\|us\|ns"

" ------------------------------------------------------------------------------

syntax region iecDateLit contains=iecDatePrefix,iecDateComp
  \ start="ltime_of_day#\|time_of_day#\|ldt#\|tod#\|ltod#\|dt#\|ld#\|d#\|date_and_time#\|date#\|ld#\|ldate_and_time#\|ldate#"
  \ end="\>"

syntax match iecDatePrefix contained "ltime_of_day#\|time_of_day#\|ldt#\|tod#\|ltod#\|dt#\|ld#\|d#\|date_and_time#\|date#\|ld#\|ldate_and_time#\|ldate#"
syntax match iecDateComp contained "\(\d[0-9_]*\)\(\.\d[0-9_]*\)\=[\-\:]\="
"-\=

" ------------------------------------------------------------------------------

syn keyword iecType ton tof sr rs
syn keyword iecType r_edge f_edge

"syntax match iecTypePrefix "\<^\(t#\|time#\|lt#\|ltime#\)[a-z]*[0-9a-z_]*\#"

" ------------------------------------------------------------------------------

syn keyword iecType sint int dint lint usint uint udint ulint
syn keyword iecType real lreal
syn keyword iecType bool byte word dword lword
syn match iecType "\(time\|ltime\|date\|ldate\|time_of_day\|tod\|ltime_of_day\|ltod\|date_and_time\|dt\|ldate_and_time\|ldt\)\>[^#]"
syn keyword iecType string wstring char wchar

" ------------------------------------------------------------------------------

" TODO highlight errorneous string escapes

syntax region  iecString	contains=@Spell,iecEscape,iecEscWide start=+"+ skip=+""+ end=+"+ 
syntax region  iecString	contains=@Spell,iecEscape,iecEscShort start=+'+ skip=+''+ end=+'+ 

"TODO rest of escapes
syntax match iecEscape contained "\$[\$tn]"
syntax match iecEscShort contained "\$\x\x"
syntax match iecEscShort contained "\$\'"
syntax match iecEscWide contained "\$\x\x\x\x"
syntax match iecEscWide contained "\$\""

" ------------------------------------------------------------------------------

syntax region iecComment oneline contains=@Spell,iecTodo start="//" end="$"
syntax region iecComment contains=@Spell,iecTodo start="/\*" end="\*/"
syntax region iecComment contains=@Spell,iecTodo start="(\*" end="\*)"

syntax region  iecPreproc start="{" end="}"

syn keyword iecTodo contained TODO FIXME XXX DEBUG NOTE

" ------------------------------------------------------------------------------

syntax match   iecNumber		"\<\d[0-9_]*\(\.\d[0-9_]*\)\=\([Ee][+-]\=\d[0-9_]*\)\=\>"
syntax match   iecNumber		"\<\d\d\=#\x[0-9a-f_]*\(\.\x[0-9a-f_]*\)\="

"highlight def link iecTimeLit		Number
highlight def link iecTimePrefix	Type
highlight def link iecTimeComp		Number
highlight def link iecTimeUnit		Special

highlight def link iecDatePrefix	Type
highlight def link iecDateComp          Number

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


