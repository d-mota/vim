set nocompatible
"set encoding=utf-8
" set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim
set modeline
set modelines=10
set scrolloff=10
set tabstop=3
set shiftwidth=3
set path+=**
set nowrap
set diffopt=filler,iwhite,vertical
"set nowrapscan
"set relativenumber
set backspace=eol,indent,start
set ignorecase
set smartcase
"set undofile
"set undodir=~/.vimundo

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configure packages
filetype plugin on
filetype off
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim' "Expanding abbreviations
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'eparreno/vim-l9' "Vim script library
Plug 'alvan/vim-closetag' "Auto close tags
"Plug 'vim-scripts/FuzzyFinder' "<leader>ff
Plug 'ervandew/supertab'
Plug 'ap/vim-css-color'
Plug 'tmhedberg/matchit' "%
Plug 'sukima/xmledit'
Plug 'groenewege/vim-less' "less css
Plug 'xolox/vim-misc'
Plug 'honza/vim-snippets'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite-outline'
Plug 'xolox/vim-notes'
Plug 'vim-scripts/VimClojure'
Plug 'vim-scripts/errormarker.vim' "highlights errors
Plug 'tpope/vim-fireplace' "Clojure thing
Plug 'simnalamburt/vim-mundo' "undo
Plug 'tpope/vim-vinegar'
Plug 'https://github.com/vim-scripts/paredit.vim.git'
Plug 'jamessan/vim-gnupg'
Plug 'ledger/vim-ledger'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/vim-scripts/summerfruit256.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leafgarland/typescript-vim'
Plug 'vimwiki/vimwiki'
Plug 'maelvalais/gmpl.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

let g:gitgutter_max_signs=1500
let g:paredit_electric_return=0
let g:netrw_winsize = 25
"UNITE CONFIG
let g:unite_source_grep_command="ag"
let g:unite_redraw_hold_candidates = 50000
let g:unite_source_rec_async_command ='ag --follow --nocolor --nogroup --hidden -g ""'
" Customize
let g:unite_source_issue_jira_priority_table = {
  \ 10000: '◡', 1: '⚡', 2: 'ᛏ', 3: '●', 4: '○', 5: '▽' }

let g:unite_source_issue_jira_status_table = {
  \ 1: 'plan', 3: 'develop', 4: 'reopened', 5: 'resolved', 6: 'closed',
  \ 10000: 'feedback', 10001: 'staged', 10002: 'waiting',
  \ 10003: 'deployed', 10004: 'pending', 10008: 'review' }

let g:unite_source_issue_jira_type_table = {
  \ 1: 'bug', 2: 'feature', 3: 'task', 4: 'change', 5: 'sub-task',
  \ 6: 'epic', 7: 'story', 8: 'system', 9: 'sub-bug' }

"NOTES CONFIG
let g:notes_directories = ['~/.vim-notes']

let g:Powerline_symbols="fancy"
let g:ctrlp_custom_ignore = { 'dir': '^build$' }
let g:ctrlp_use_caching = 0 "NEW
let g:ctrlp_user_command = 'find %s -type f'       "NEW 
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:5,results:10'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tml"
let g:EclimJavascriptValidate = 0
let g:ctrlp_regexp = 0
let g:EclimJavaSearchSingleResult = "edit"
let g:EclimKeepLocalHistory = 1
" let g:EclimDtdValidate = 0
" let g:EclimXsdValidate = 0
" let g:EclimXmlValidate = 0
" let g:EclimHtmlValidate = 0
" NERDTREE CONFIGURATION
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let NERDTreeWinSize=51

" AIRLINE CONFIGURATION 
"let g:Powerline_symbols = 'fancy'

" OTHER CONFIGURATION
filetype plugin indent on
set ts=3
set nu
set laststatus=2
runtime macros/matchit.vim

" LINUX TERMINAL SETS
"map <ESC>[C <C-Right>
"map <ESC>[D <C-Left>
"map <ESC>[A <C-Up>
"map <ESC>[B <C-Down>

" REMAPPINGS
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap L :tabnext<cr>
nnoremap H :tabprevious<cr>
nnoremap <C-Up> :cp<cr>
nnoremap <C-Down> :cn<cr>
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <Right> :bnext<cr>
nnoremap <Left> :b#<cr>
nnoremap JJc :JavaCorrect<cr>
nnoremap JJi :JavaImport<cr>
nnoremap JJg :JavaGetSet<cr>
nnoremap JJh :JavaCallHierarchy<cr>
nnoremap JJp :ProjectList<cr>
nnoremap JJP :ProjectProblems!<cr>
nnoremap JJs :JavaSearchContext<cr>
nnoremap JJt :ProjectTree<cr>
nnoremap J <Nop>
nnoremap tt :call TapestryFind()<cr>
nnoremap ZZ <c-w><c-z>
" nnoremap "" i"+<cr>"<esc>==
nnoremap + i"+<cr>"<esc>==
"nnoremap - i<cr><esc>==
nnoremap JK :w<cr> 

nnoremap / /\c
nnoremap <F8> :call JavaErrorToggle()<cr>
nnoremap <F6> :bw<cr>
nnoremap <F5> :MundoToggle<cr>
nnoremap <F7> :make<cr>
nnoremap ZZ <c-w>z

" INSERT MAPPINGS
inoremap <C-j> <esc>:TmuxNavigateDown<cr>a
inoremap jk <esc>:w<cr>
inoremap JK <esc>:w<cr>
"inoremap <esc> <Nop>
" inoremap <C-w> <esc>:w<cr>i
inoremap <C-Left> <esc>:b#<cr>
inoremap {<Enter> {<Enter>}<esc>==O
inoremap <C-l> <c-x><c-l>
inoremap <C-u> <c-x><c-u>
" inoremap "" ""<esc>i
" inoremap <C-T> <esc>f>v%di
"inoremap <C-P> <esc>$pi
inoremap <C-E> <esc>lmmf>v%d$p`mi
inoremap í &#237;
inoremap `e &eacute;
inoremap `a &aacute;
inoremap `i &iacute;
inoremap `o &oacute;
inoremap `u &uacute;
"inoremap <leader>' `
"inoremap :w<cr> <esc>:w<cr>
"inoremap llog logging.log.Log.macroLog();<esc>hi


" LEADER MAPPINGS
let mapleader="\<Space>"
nnoremap <leader>ff :FZF<cr>
nnoremap <leader>fb :FufBuffer<cr>
nnoremap <leader>jo :Unite outline<cr>
"nnoremap <leader>p :ProjectList<cr>
nnoremap <leader>p :cprev<cr>
nnoremap <leader>P :ProjectProblems!<cr>
nnoremap <leader>t :!ctags -R src csrc action sql<cr>
nnoremap <leader>c :JavaCorrect<cr>
nnoremap <leader>i :JavaImport<cr>
nnoremap <leader>h :JavaCallHierarchy<cr>
nnoremap <leader>ev :tabnew ~/.vimrc<cr>g;
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>st ciwtrue<esc>
nnoremap <leader>sf ciwfalse<esc>
"nnoremap <leader>tt :call TapestryFind()<cr>
"nnoremap <leader>pp :CtrlP<cr>
"nnoremap <leader>pb :CtrlPBuffer<cr>
nnoremap <leader>jg :JavaGetSet<cr>
nnoremap <leader>z zfa{
nnoremap <leader>o :JavaImportOrganize<cr>
nnoremap <leader>n :cn<cr>
nnoremap <leader>as <esc>:!ant<cr>
nnoremap <leader>aa <esc>:!ant all<cr>
nnoremap <leader>m <esc>:marks<cr>
nnoremap <leader>b "bp
nnoremap <leader>s :JavaSearchContext<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>w :cwin<cr> 
nnoremap <leader>q <c-w>c
nnoremap <leader>pb :!buildsystem/bin/updatebuttons %<cr>
nnoremap <leader>ub :Unite buffer<cr>
nnoremap <leader>= :%!tidy -xml -indent -q -<cr> 
nnoremap <leader>gl :!tig -- %<cr>
nnoremap <leader>gb :Gblame<cr>

" ECLIM SETTINGS
let g:EclimLoggingDisabled=1
let g:EclimJavaHierarchyDefaultAction='edit'
let g:EclimCompletionMethod = 'omnifunc'
" SOLARIZED
syntax enable
colorscheme solarized
set background=dark
"let g:solarized_termcolors=256
let g:solarized_bold=1
let g:solarized_menu=1
let g:solarized_italic=1

set t_Co=256
" set t_Co=16

"colorscheme summerfruit256
"Ctrlp config
set wildignore+=*.class,*.jar,*/build/*
let g:ctrlp_by_filename = 0

"Incremental search
set incsearch

"Do not highlight everything
" set nohlsearch
set hlsearch

"TML files are xml
autocmd BufNewFile,BufRead,BufEnter *.tml :set filetype=xhtml
autocmd BufNewFile,BufRead,BufEnter afiedt.buf :set filetype=sql
autocmd BufNewFile,BufRead,BufEnter *.conf :set filetype=apache


"Enable persistent undo
" if has('persistent_undo')
" 	set undofile
" 	set undodir=$HOME/.vimundo
" 	set undolevels=5000
" endif

set wildmode=list:longest,full
"set wildmode=list

set wildignore+=*/target/*
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
set ruler
set hidden
" colorscheme atom-dark-256

" set cursorline

" Abbreviation

"ab aacute &#225;
"ab eacute &#233; 
"ab iacute &#237;
"ab oacute &#243;
"ab uacute &#250;
"ab nbsp &#160;

" UltiSnips
" let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 2

" Asycn easy tags
let g:easytags_async=1

" Set bookmark directory
let NERDTreeBookmarksFile=".NERDTreeBookmarks"
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=['\.vim$', '\~$', '^target$','^build$','WebContent','gradle','hibernate_merge','git_tasks','install','lib','EngineeringServices','docs','compilelib','clients','bin','aspects','xdoclet','tests','^sers$','run','override','Library','integration','customtests']

let g:csv_highlight_column = 'y'

set cursorline

" Supertab settings
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabLongestEnhanced = 0
"set completefunc=syntaxComplete#Complete
autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \ endif
" Toggle Java Errors
let g:JavaErrorWindowOpen = 0
function! JavaErrorToggle()
	if g:JavaErrorWindowOpen
		cclose
		let g:JavaErrorWindowOpen = 0
	else
		:ProjectProblems!
		let g:JavaErrorWindowOpen = 1
	endif
endfunction

function! TapestryFind()
        let filesplit=split(expand('%'),'\.')
        if filesplit[1]=='tml'
                execute ":edit ". substitute(filesplit[0].'.java','resources','java','')
        else
                execute ":edit ".substitute(filesplit[0].'.tml','java','resources','')
        endif
endfunction


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ -o

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 1
endif

" VIMCLOJURE CONFIG
" let vimclojure#WantNailgun = 1
" let vimclojure#NailgunClient = "/home/dmota/vimclojure-easy/lib/vimclojure-nailgun-client/ng"
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

hi CursorLine cterm=none
"set complete=.,w,b,u,i
set complete=.

" LOCAL CONFIG
try
	source ~/.vimlocal
catch
endtry

