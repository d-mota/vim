let s:plugindir=expand("<sfile>:p:h")
let s:parsedConfigs={}
let s:recalculated=0

function! AddFormEntry(values)
	let s:parsedConfigs['f:nt:'.a:values[2]]=a:values[1]
	let s:parsedConfigs['f:tn:'.a:values[1]]=a:values[2]
endfunction

function! AddActionEntry(values)
	let s:parsedConfigs['a:tn:'.a:values[1]]=a:values[2]
	let ntKey='a:nt:'.a:values[2]
	if has_key(s:parsedConfigs,ntKey)
		call add(s:parsedConfigs[ntKey],a:values[1])
	else
		let s:parsedConfigs[ntKey]=[a:values[1]]
	endif
	let s:parsedConfigs['a:pt:'.a:values[3]]=a:values[1]
	let s:parsedConfigs['a:pn:'.a:values[2]]=a:values[3]
endfunction

function! AddConfigEntry(entry)
	let values=split(a:entry,",")
	if values[0] == "form"
		call AddFormEntry(values)
	else
		call AddActionEntry(values)
	endif
endfunction

function! FindStruts()
	if s:recalculated == 0
		call ReloadStruts()
		let s:recalculated = 1
	endif
	let currentFile=substitute(expand("%:r"),'action/','','g')
	let ext=expand("%:e")
	if "java" == ext
		try
			let actions=Dedup(s:parsedConfigs['a:nt:'.s:parsedConfigs['f:tn:'.substitute(currentFile,'/','.','g')]])
			if len(actions)>0
				call OpenType(actions)
				return
			endif
		catch /.*/
		endtry
		try
			let forms=[s:parsedConfigs['f:nt:'.s:parsedConfigs['a:tn:'.substitute(currentFile,'/','.','g')]]]
			if len(forms)>0
				call OpenType(forms)
				return
			endif
		endtry
	elseif "dyn" == ext
		if search('action="','c')	
			:normal f"yi"
			let path=substitute(split(getreg("\""),"?")[0],'\.do','','g')
			call OpenType([s:parsedConfigs['a:pt:'.path]])
		endif
	endif
endfunction

function! OpenType(types)
	if len(a:types)==1
		let t='action/'.substitute(get(a:types,0),'\.','/','g').'.java'
		:execute ':e '.t
	endif
endfunction

function! Dedup(list)
	let nodups={}
	for e in a:list
		let nodups[e]=''
	endfor
	return keys(nodups)
endfunction	

function! ReloadStruts()
	echom "Recalculating struts files..."
	let cwd=getcwd()
	let s:parsedConfigs={}
	if filereadable(l:cwd . '/build.xml')		
		let strutsConfig=split(system("buildsystem/bin/MergeStruts.py web/WEB-INF/*config.xml /dev/stdout | xsltproc ". s:plugindir . "/struts-to-csv.xsl /dev/stdin"),"\n")
		for entry in strutsConfig
			call AddConfigEntry(entry)
		endfor		
	endif
endfunction

"call ReloadStruts()
nnoremap <leader>sa :call FindStruts()<cr>
