" Environment {
	" Basics {
		set nocompatible " must be first line
		"set background=dark " Assume a dark background
	" }
	
	" Windows Compatible {
	" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
	" across (heterogeneous) systems easier.
	if has('win32') || has('win64')
		set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
	endif
	" }
	"
	" Setup Bundle Support {
	" The next two lines ensure that the ~/.vim/bundle/ system works
		runtime! autoload/pathogen.vim
		silent! call pathogen#helptags()
		silent! call pathogen#runtime_append_all_bundles()
		"silent! call pathogen#infect()
	" }
	
" }

""""""""""""
"  basics  "
""""""""""""
" change the mapleader from \ to ,
let mapleader=","
set tabstop=2
set number
set ruler
set smartindent

" http://nvie.com/posts/how-i-boosted-my-vim/
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set nowrap                               "" don't wrap lines
"set tabstop=4                           "" a tab is four spaces
set backspace=indent,eol,start
                                         "" allow backspacing over everything in insert mode
set autoindent                           "" always set autoindenting on
"set copyindent                          "" copy the previous indentation on autoindenting
set number                               "" always show line numbers
"set shiftwidth=4                        "" number of spaces to use for autoindenting
set shiftround                           "" use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                            "" set show matching parenthesis
set ignorecase                           "" ignore case when searching
set smartcase                            "" ignore case if search pattern is all lowercase,
                                         "" case-sensitive otherwise
set smarttab                             "" insert tabs on the start of a line according to
                                         "" shiftwidth, not tabstop
set hlsearch                             "" highlight search terms
set incsearch                            "" show search matches as you type
set history=1000                         "" remember more commands and search history
set undolevels=1000                      "" use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                "" change the terminal's title
set visualbell                           "" don't beep
set noerrorbells                         "" don't beep
set nobackup
set noswapfile

"don't force to save files when close o edit new ones
set hidden

set nowrap        "" don't wrap lines

map <F2> :NERDTreeToggle<CR>
map <F4> :set paste!<CR>

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

"tests and tutorials
map <Leader>o :NERDTreeToggle
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

"align | , tabularize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"inoremap <silent> = =<Esc>:call <SID>ealign()<CR>a
"function! s:ealign()
"  let p = '^.*=.*$'
"  if exists(':Tabularize') && getline('.') =~# '^.*=' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
"    let column = strlen(substitute(getline('.')[0:col('.')],'[^=]','','g'))
"    let position = strlen(matchstr(getline('.')[0:col('.')],'.*=\s*\zs.*'))
"    Tabularize/=
"    normal! 0
"    call search(repeat('[^=]*=',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
"  endif
"endfunction

""""
""" old .vimrc function
""""
"call pathogen#infect() 

syntax on
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set number
set ruler

" highlight searches
set hlsearch

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif
syntax on


""
" MAPPINGS
""
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map! <F3> <C-R>=strftime('%c')<CR><Esc>
nnoremap <silent> <F2> :lchdir %:p:h<CR>:pwd<CR>



"SEARCH
"vimgrep next and previous
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"This mapping uses <cword> to get the word under the cursor, and searches for it in the current directory and all subdirectories, opening the quickfix window when done:
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>



"TABS
"
"custom tab stuff
map <A-]> :tabnext<CR>
map <A-[> :tabprevious<CR>
map <A-n> :tabnew<CR>
map <A-w> :tabclose<CR>


"Indentation

