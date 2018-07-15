if exists("b:current_syntax")
	finish
endif

syn match connectionSummary "\v\* \d+ connections.*" keepend contains=responsible
syn match responsible /\(:\)\@<=.*/ contained
syn match connectionKeywords "CONNECTIONS:\|KEY:"  
syn match connectionUuid "\vUUID.*" contains=uuidvalue
syn match uuidValue "\v(\w+\-)+\w+" contained
syn keyword connectionProperties DURATION PERMANENT SESSION
highlight link connectionKeywords Identifier
highlight link connectionSummary Type 
highlight link connectionUuid Title
highlight link responsible SpecialKey
highlight link uuidValue SpecialKey

let b:current_syntax="connections"
