" Environment {
	" Basics {
		set nocompatible " must be first line
		set background=dark " Assume a dark background
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

"basics
set tabstop=2
set number
set smartindent
set autoindent

map <F2> :NERDTreeToggle<CR>
map <F4> :set paste!<CR>

let mapleader=','
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

