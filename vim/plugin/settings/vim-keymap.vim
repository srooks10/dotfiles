" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
let mapleader=","

" ==================================================
" hide matches on <leader>space
" ==================================================
nnoremap <leader><space> :nohlsearch<cr>

" ==================================================
" the following will make tabs and trailing spaces visible when requested
" ==================================================
nmap <silent> <leader>s :set nolist!<CR>

" ==================================================
" vimrc development
" ==================================================
" brings up my .vimrc
map <leader>v :sp ~/.vimrc<CR><C-W>_
" reload it -- making all changes active (have to save first)
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ==================================================
" Remap ` to '
" ==================================================
" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma. But ` is less easy to reach. Swap them:

nnoremap ' `
nnoremap ` '

" ==================================================
" Scroll viewport faster
" ==================================================
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" ==================================================
" Make j and k work on wrapped lines
" ==================================================
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ==================================================
" Moving in the change list and center the screen
" ==================================================
nnoremap g; g;zz
nnoremap g, g,zz

" ==================================================
" Navigation between windows
" ==================================================
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-O> <C-W>o

" ==================================================
" Reselect visual block after indent/outdent
" ==================================================
vnoremap < <gv
vnoremap > >gv
