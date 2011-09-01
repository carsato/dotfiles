call pathogen#infect() 

syntax on
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set number
set ruler

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


