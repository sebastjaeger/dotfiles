"""""""""""""""""""""""""""""""
" Basics
"""""""""""""""""""""""""""""""
set nocompatible                  " Disable vi compatibility mode


"""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Vundle bundles
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" Vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'snipMate'
Bundle 'bufexplorer.zip'
Bundle 'SuperTab' 
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'minibufexpl.vim'
Bundle 'taglist.vim'
Bundle 'molokai'
Bundle 'desert256.vim'

" Non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'


"""""""""""""""""""""""""""""""
" Pathogen
"""""""""""""""""""""""""""""""
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
"filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()


"""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""
filetype plugin indent on         " Enable filetype-specific features
syntax on                         " Syntax highlighting

set visualbell                            " Use visual bell instead of beeping 
set noerrorbells
"set writebackup                   " Create backup file and delete on saving
"set autowrite                     " Write on changing buffer
set hidden                        " Allow to change buffers without saving them
set mouse=ar                      " Use mouse
set virtualedit=all               " Edit anywhere
set backspace=indent,eol,start    " Allow backspacing over everything in insert
                                  " mode
set wildmenu                      " Enable wildmenu for tab-completion
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*~,*.swp,*.pyc,*.so

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

set showmatch                     " Show matching brackets
set splitright                    " New window should open on the right
"set splitbelow                    " and below the current window
set nojoinspaces                  " Only one space between joined lines
set title

set whichwrap+=<,>,[,],h,l   " Allow specified keys that move the cursor
                             " left/right to move to the previous/next line
                             " when the cursor is on the first/last character
                             " in the line. b (backspace), s (space) and the
                             " arrows

silent execute '!mkdir -p ~/.vim_backups'
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//

set tags=tags;$HOME
set nu


"""""""""""""""""""""""""""""""
" Looks
"""""""""""""""""""""""""""""""
set cursorline                 " highlight cursor line
if has('gui_running')          " Remove toolbar and menubar in gvim
    set guioptions-=T
    set guioptions-=m
    "colorscheme desert
"else
    "set t_Co=256
    "colorscheme desert256
endif
colorscheme molokai


"""""""""""""""""""""""""""""""
" Tab and indent
"""""""""""""""""""""""""""""""
set expandtab                  " Insert spaces by default
set tabstop=4                  " Number of columns a tabs accounts for
set softtabstop=4              " Tab and indent depth
set shiftwidth=4               " Number of columns that text is indented with
                               " the reindent " operations
set smarttab                   " Use shiftwidth instead of tabstop at start
                               " of line (?)
"set smartindent
set autoindent


"""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""
set incsearch                " Enable incremental search
set ignorecase               " Case-insensitive search
set smartcase                " Unless there are uppercase letters
set hls                      " Enable search highlighting


"""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""
let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" j and k are supposed to jump between lines on the _screen_
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Same for arrows
nnoremap <up> gk
nnoremap <down> gj
inoremap <up> <C-o>gk
inoremap <down> <C-o>gj

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

map Y y$
map <Backspace> X
"map <Tab> i<Tab><Esc>^
map <CR> i<CR><Esc>
map <S-Enter> mzO<Esc>`z
map <C-Enter> mzo<Esc>`z
map <Space> i <Esc>l

noremap ,, :%s:::g<Left><Left><Left>

vmap > >gv
vmap < <gv

set pastetoggle=<F2>      "Keep indentation when in paste mode

if v:version >= 700
    set list listchars=tab:»·,trail:·
else
    set list listchars=tab:>-,trail:-
endif
set nolist
"map <silent> <leader>l :set list!<CR>
map <silent> <F12> :set list!<CR>

"map <silent> <leader>no :nohls<CR>
map <silent> <F9> :nohls<CR>
"map <silent> <S-F4> :set hls!<Bar>set hls?<CR>

if has('autocmd')
    autocmd FileType python map <leader>x :!python %<CR>
endif

"function! ToggleCw()
    "let g:cw_on = exists('g:cw_on') ? !g:cw_on : 0
    "if g:cw_on
        "cclose
    "else
        "copen
    "endif
"endfunction
"map <silent> <F12> :call ToggleCw()<CR>

map <silent> <S-F10> :Ex<CR>
map <silent> <leader>c :silent! !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ .<CR>

cmap w!! w !sudo tee % >/dev/null

" Search for the ... arguments separated with whitespace (if no '!'),
" or with non-word characters (if '!' added to command).
function! SearchMultiLine(bang, ...)
  if a:0 > 0
    let sep = (a:bang) ? '\_W\+' : '\_s\+'
    let @/ = join(a:000, sep)
  endif
endfunction
command! -bang -nargs=* -complete=tag S call SearchMultiLine(<bang>0, <f-args>)|normal! /<C-R>/<CR>

"""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""
cabbr Q q
cabbr Q! q!
cabbr Qa qa
cabbr QA qa
cabbr Qa! qa!
cabbr QA! qa!
cabbr Wa wa
cabbr WA wa
cabbr Wqa wqa
cabbr W w
cabbr X x
cabbr Xa xa
cabbr XA xa


"""""""""""""""""""""""""""
" Other stuff
"""""""""""""""""""""""""""

if has('autocmd')
    autocmd BufEnter ?akefile* set noet ts=8 sts=8 sw=8    " Settings for Makefiles
endif


"""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""
" MiniBufExplorer settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" TList
nnoremap <silent> <F11> :TlistToggle<CR>
" Close preview window when completion finished
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
" NERD tree
map <silent> <F10> :NERDTreeToggle<CR>


