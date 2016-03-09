
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Begin: bundle scripts
"

if '' == glob('~/.vim/bundle/neobundle.vim')
  silent! !mkdir -p ~/.vim/bundle
  silent! !git clone https://github.com/Shougo/neobundle.vim
      \ ~/.vim/bundle/neobundle.vim
endif

if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'kpanasiuk/ftplugins'               " options for filetypes
NeoBundle 'tpope/vim-sensible'                " common options
NeoBundle 'altercation/vim-colors-solarized'  " colorscheme
NeoBundle 'scrooloose/nerdtree'               " filesystem browser
NeoBundle 'bling/vim-airline'                 " status line and tabs/buffers
NeoBundle 'terryma/vim-multiple-cursors'      " multiple cursors
NeoBundle 'kien/ctrlp.vim'                    " quick file search
NeoBundle 'ervandew/supertab'                 " test complete by <tab>
NeoBundle 'dyng/ctrlsf.vim'                   " power search/view/edit

" Version control
NeoBundle 'tpope/vim-fugitive'                " git wrapper
NeoBundle 'airblade/vim-gitgutter'            " git diff
" NeoBundle 'juneedahamed/vc.vim'               " svn, git, hg, bzr

NeoBundle 'tpope/vim-surround'                " surrounding (), [], {}, etc
NeoBundle 'endwise.vim'                       " auto add endif, endfunction, etc
NeoBundle 'scrooloose/syntastic'              " syntax checking plugin

" NeoBundle 'rizzatti/funcoo.vim'
" NeoBundle 'rizzatti/dash.vim'

" NeoBundle 'tpope/vim-commentary'
" NeoBundle 'tpope/vim-dispatch'

" Async processes
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Begin: options
"

set visualbell
set ttyfast
set clipboard=unnamed
set modelines=0
set encoding=utf-8
set hidden
set formatoptions=n1

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set wildmode=longest,list
set completeopt=longest,menu,preview

set scrolloff=3
set wrap
set colorcolumn=80
set norelativenumber
set number
set cursorline
set showmode

"set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch

set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/undo
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

if '' == glob('~/.vim/undo')
  silent! !mkdir -p ~/.vim/undo
endif
if '' == glob('~/.vim/backup')
  silent! !mkdir -p ~/.vim/backup
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Begin: key map
"

let mapleader = ","
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><leader> <c-^>
nnoremap <C-u> gUiw
nnoremap <C-p> Vy<esc>p
vnoremap <leader>S y:execute @@<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>
nnoremap vv ^vg_
nnoremap gn <esc>:tabnew<cr>
nnoremap <tab> >>
vnoremap <tab> >
nnoremap <S-tab> <<
vnoremap <S-tab> <

cnoremap <c-a> <home>
cnoremap <c-e> <end>

nnoremap <leader>V V`]
cmap w!! w !sudo tee % >/dev/null
nnoremap vv V

nnoremap <silent> <leader><space> :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Begin: bundle options
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors

let g:multi_cursor_exit_from_insert_mode = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree

map <F4> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '▶'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized

"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-p

let g:ctrlp_map = "<c-p>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSF

let g:ctrlsf_auto_close = 0
let g:ctrlsf_confirm_save = 0
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_position = 'right'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Begin: functions
"

" Delete trailing white space on write
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Comments
let s:comment_map = {
  \   "c": '//',
  \   "cpp": '//',
  \   "go": '//',
  \   "java": '//',
  \   "javascript": '//',
  \   "php": '//',
  \   "python": '#',
  \   "ruby": '#',
  \   "vim": '"',
  \   "haskell": '--',
  \   "cabal": '--',
  \ }

function! ToggleComment() range
  if !has_key(s:comment_map, &filetype)
    echo "No comment leader found for filetype"
    return
  end

  let commentLeader = s:comment_map[&filetype]
  let indent = ""
  let indentlen = -1
  let ncomments = 0
  let nlines = 0

  let i = a:firstline
  while i <= a:lastline
    let l = getline(i)
    if l !~ '\v^\s*$'
      let s = matchstr(l, '\v^\s*')
      let n = strlen(s)
      if n < indentlen || -1 == indentlen
        let indentlen = n
        let indent = s
      endif
      let nlines += 1
      if l =~ '\v^\s*' . commentLeader
        let ncomments += 1
      endif
    endif
    let i += 1
  endwhile

  if nlines != ncomments || 0 == nlines
    let cmd = 's=\v^(' . indent . ')?=' . indent . commentLeader . " =e"
  else
    let cmd = 's=^\v(\s*)' . commentLeader . ' ?=\1=e'
  endif

  let i = a:firstline
  while i <= a:lastline
    execute 'silent ' . i . cmd
    let i += 1
  endwhile
endfunction

function! ToggleCommentSimple() range
  if !has_key(s:comment_map, &filetype)
    echo "No comment leader found for filetype"
    return
  end

  let commentLeader = s:comment_map[&filetype]
  let ncomments = 0
  let nlines = 0

  let i = a:firstline
  while i <= a:lastline
    let l = getline(i)
    if l =~ '\v^\s*' . commentLeader
      let ncomments += 1
    endif
    if l !~ '\v^\s*$'
      let nlines += 1
    endif
    let i += 1
  endwhile

  if nlines != ncomments || 0 == nlines
    let cmd = 's=^=' . commentLeader . '=e'
  else
    let cmd = 's=^\v(\s*)' . commentLeader . '=\1=e'
  endif

  let i = a:firstline
  while i <= a:lastline
    execute 'silent ' . i . cmd
    let i += 1
  endwhile
endfunction

nnoremap <silent> <leader>/ :call ToggleComment()<cr>
vnoremap <silent> <leader>/ :call ToggleComment()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SearchAndReplace(old, new, ...)
  let old = shellescape(a:old)
  let oldesc = substitute(a:old, '/', '\/', 'g')
  let newesc = substitute(a:new, '/', '\/', 'g')
  let subst = shellescape('s/' . oldesc . '/' . newesc . '/g')
  let files = ''
  for f in a:000
    let files += ' ' . shellescape(f)
  endfor
  execute '!grep -r -l ' . old . ' ' . files . ' | xargs sed -i -e ' . subst
endfunction
"nmap <leader>r :call SearchAndReplace('<c-r><c-w>', '<c-r><c-w>')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
