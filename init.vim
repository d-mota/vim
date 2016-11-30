set nocompatible
"set encoding=utf-8
" set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim

set scrolloff=10
set tabstop=3
set shiftwidth=3
set path+=**


" Configure bundle
filetype plugin on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'L9'
Plugin 'alvan/vim-closetag'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'ervandew/supertab'
Plugin 'ap/vim-css-color'
Plugin 'tmhedberg/matchit'
Plugin 'sukima/xmledit'
Plugin 'groenewege/vim-less'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'chrisbra/csv.vim'
"Plugin 'mattn/webapi-vim'
"Plugin 'tyru/open-browser.vim'
"Plugin 'Shougo/unite.vim'
"Plugin 'rafi/vim-unite-issue'
Plugin 'xolox/vim-notes'
Plugin 'vim-scripts/VimClojure'
Plugin 'tpope/vim-fireplace'
Plugin 'simnalamburt/vim-mundo'
call vundle#end()

"UNITE JIRA CONFIG
let g:jira_url = 'https://jira.wavecode.com'
let g:jira_username = ''
let g:jira_password = ''
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
let g:notes_directories = ['~/wavecode/notes']

let g:Powerline_symbols="fancy"
let g:ctrlp_custom_ignore = { 'dir': '^build$' }
let g:ctrlp_by_filename = 1
let g:SuperTabDefaultCompletionType = 'context'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tml"
let g:EclimJavascriptValidate = 0
let g:EclimJavaSearchSingleResult = "edit"
let g:EclimKeepLocalHistory = 1
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
nnoremap - i<cr><esc>==
nnoremap JK :w<cr> 
nnoremap / /\c
nnoremap <F8> :call JavaErrorToggle()<cr>
nnoremap <F6> :bw<cr>
nnoremap ZZ <c-w>z

" INSERT MAPPINGS
inoremap jk <esc>:w<cr>
inoremap JK <esc>:w<cr>
inoremap <C-w> <esc>:w<cr>i
inoremap <C-Left> <esc>:b#<cr>
inoremap {<Enter> {<Enter>}<esc>==O
inoremap <C-l> <c-x><c-l>
inoremap <C-u> <c-x><c-u>
" inoremap "" ""<esc>i
inoremap <C-T> <esc>f>v%di
inoremap <C-P> <esc>$pi
inoremap <C-E> <esc>lmmf>v%d$p`mi
inoremap `e &eacute;
inoremap `a &aacute;
inoremap `i &iacute;
inoremap `o &oacute;
inoremap `u &uacute;
inoremap :w<cr> <esc>:w<cr>

" LEADER MAPPINGS
let mapleader="\<Space>"
nnoremap <leader>p :ProjectList<cr>
nnoremap <leader>t :ProjectTreeToggle<cr>
nnoremap <leader>c :JavaCorrect<cr>
nnoremap <leader>i :JavaImport<cr>
nnoremap <leader>h :JavaCallHierarchy<cr>
nnoremap <leader>ev :tabnew ~/.vimrc<cr>g;
nnoremap <leader>sv :source ~/.vimrc<cr>
nnoremap <leader>tt :call TapestryFind()<cr>
nnoremap <leader>pp :CtrlP<cr>
nnoremap <leader>pb :CtrlPBuffer<cr>
nnoremap <leader>g :JavaGetSet<cr>
nnoremap <leader>z  ZZ
nnoremap <leader>n :cn<cr>
nnoremap <leader>a "ap
nnoremap <leader>b "bp
nnoremap <leader>s :JavaSearchContext<cr>
nnoremap <leader>b :Buffers<cr>

" ECLIM SETTINGS
let g:EclimLoggingDisabled=1

" SOLARIZED
syntax enable
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_bold=1
let g:solarized_menu=1
let g:solarized_italic=1
set background=dark

" set t_Co=256
set t_Co=16

"Ctrlp config
set wildignore+=*.class,*.jar,*/build/*

"Incremental search
set incsearch

"Do not highlight everything
" set nohlsearch

"TML files are xml
autocmd BufNewFile,BufRead,BufEnter *.tml :set filetype=xhtml

"Enable persistent undo
" if has('persistent_undo')
" 	set undofile
" 	set undodir=$HOME/.vimundo
" 	set undolevels=5000
" endif

"set wildmode=list:longest,full
set wildmode=list

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
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 2

" Asycn easy tags
let g:easytags_async=1

" Set bookmark directory
let NERDTreeBookmarksFile=".NERDTreeBookmarks"

let g:csv_highlight_column = 'y'

set cursorline

" Supertab settings
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

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
